class AppExceptions implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  AppExceptions([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppExceptions {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responding', url);
}

class ValidationFiledsException extends AppExceptions {
  ValidationFiledsException([String? message, String? url])
      : super(message, 'Api not responding', url);
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized', url);
}

class UnVerifiedException extends AppExceptions {
  UnVerifiedException([String? message, String? url])
      : super(message, 'Not Verified', url);
}
