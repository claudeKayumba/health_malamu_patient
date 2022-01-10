// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_utils;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'dart:developer' as developer;
import 'package:velocity_x/velocity_x.dart';

import 'app_exceptions.dart';

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Api {
  static const apiVersion = '/api/v1';
  static const baseUrl = 'https://app.health-malamu.com';
  static const baseUrlVersion = baseUrl + apiVersion;
  static const auth = '/auth/login';
  static const logout = '/auth/logout';
  static const userInfo = '/user/me';
  static const patients = '/patients';
  static const appointments = '/appointments';
  static const consultations = '/consultations';
  static const medecins = '/medecins';
}

enum HttpMethode { GET, POST, PUT, PATCH, DELETE }

class HttpService {
  static const int TIME_OUT_DURATION = 30;

  static final BaseOptions _options = BaseOptions(
    baseUrl: Api.baseUrlVersion,
    validateStatus: (statusCose) => true,
    receiveDataWhenStatusError: true,
    followRedirects: false,
  );

  static final Dio _dio = Dio(_options);

  static Dio get client {
    _dio.interceptors.add(
      DioCacheManager(
        CacheConfig(
          baseUrl: Api.baseUrlVersion,
        ),
      ).interceptor,
    );
    return _dio;
  }

  static Future request(
    HttpMethode method,
    String path, {
    String? baseUrl,
    dynamic data,
    headers,
    Function(int?, int?)? onSendProgress,
    CancelToken? cancelToken,
    extra,
    queryParameters,
    bool forceRefresh = true,
  }) async {
    headers ??= {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppPrefs.to.token.val}',
    };
    dio_utils.Response _result;
    try {
      _dio.options.baseUrl = baseUrl ?? Api.baseUrlVersion;

      _result = await _dio
          .request(
            path,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: method == HttpMethode.GET
                ? buildCacheOptions(
                    const Duration(days: 7),
                    forceRefresh: forceRefresh,
                    options: Options(
                      method: method.toString().split('.').last,
                      headers: headers,
                      validateStatus: (statusCode) {
                        return true;
                      },
                    ),
                  )
                : Options(
                    method: method.toString().split('.').last,
                    headers: headers,
                    extra: extra,
                    validateStatus: (statusCode) {
                      return true;
                    },
                  ),
            data: data,
            onSendProgress: onSendProgress,
          )
          .timeout(
            TIME_OUT_DURATION.seconds,
          );
      return _processResponse(_result);
    } on Exception catch (ex) {
      _onException(ex);
    }
  }

  static _processResponse(dio_utils.Response response) {
    developer.log(response.data.toString());
    developer.log(AppPrefs.to.token.val);
    switch (response.statusCode) {
      case 200:
        if (response.data['status_code'] != null &&
            response.data['status_code'] >= 400) {
          String message = response.data['status_code'] != 500
              ? response.data['message']
              : 'Une erreur interne, veuillez contacter le service technique';
          throw BadRequestException(
            message,
          );
        }
        return response.data;
      case 400:
        throw BadRequestException(
          response.data.toString(),
        );
      case 401:
        throw BadRequestException(
          response.data['message'] ?? '',
        );
      case 422:
        if (response.data != null) {
          String error = '';
          if (response.data['errors'] != null) {
            response.data['errors'].values.toList().forEach((el) => error +=
                el.toString().replaceAll("[", "").replaceAll("]", "") + "\n");
          } else if (response.data['error_message'] != null) {
            error = response.data['error_message'];
          }
          throw ValidationFiledsException(
            error,
            response.realUri.host.toString(),
          );
        }
        break;
      case 403:
        throw BadRequestException(
          response.data['message'],
          response.realUri.host.toString(),
        );
      case 404:
        developer.log(response.realUri.path.toString());
        throw BadRequestException(
          response.data['message'].toString(),
          response.realUri.host.toString(),
        );
      case 500:
        throw ApiNotRespondingException(
          'Une erreur interne, veuillez contacter le service technique',
        );
      default:
        throw ApiNotRespondingException(
          'Veuillez vérifier votre connexion internet',
        );
    }
  }

  static void _onException(ex) {
    developer.log(ex.toString());
    if (ex is TimeoutException) {
      throw ApiNotRespondingException(
        'Connexion internet trop lente',
      );
    } else if (ex is DioError) {
      if (ex.type == DioErrorType.other) {
        throw FetchDataException(
          'Pas de connexion internet',
          ex.requestOptions.uri.toString(),
        );
      }
    } else {
      throw ex;
    }
  }
}
