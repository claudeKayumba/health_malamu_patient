import 'dart:developer' as developer;

import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:health_malamu_patient/app/utils/dialog_helper.dart';

import 'app_exceptions.dart';

class ErrorHandlerNotification {
  handleError(error) {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    developer.log(error.toString());
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message!);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showSimpleDialog(description: message!);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: error.message!, title: 'Connexion internet');
    } else if (error is ValidationFiledsException) {
      DialogHelper.showErrorDialog(
        title: 'Erreur de validation',
        description: error.message!,
      );
    } else {
      DialogHelper.showSimpleDialog(
        title: 'Erreur',
        description: "Erreur interne",
      );
    }
  }

  handleErrorMessage(error) {
    var erroMessage = {};
    if (error is BadRequestException) {
      erroMessage["errorMessage"] = "BadRequestException";
    } else if (error is FetchDataException) {
      erroMessage["message"] = "FetchDataException";
    } else if (error is ApiNotRespondingException) {
      erroMessage["message"] = "ApiNotRespondingException";
    } else if (error is ValidationFiledsException) {
      erroMessage["message"] = "ValidationFiledsException";
    } else {
      erroMessage["message"] = "Internal error";
    }
    return erroMessage;
  }
}
