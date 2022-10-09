class CustomException implements Exception {
  final String? _message;
  final String? _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class TimeOutException extends CustomException {
  TimeOutException([String? message])
      : super(message, "Timeout During Communication with server: ");
}

class ServiceUnavailable extends CustomException {
  ServiceUnavailable([String? message])
      : super(message, "Server is currently unavailable: ");
}

class DataNotFoundException extends CustomException {
  DataNotFoundException([String? message])
      : super(message, "Data requested can't be found on our servers: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised request: ");
}

class NoInternetException extends CustomException {
  NoInternetException([message]) : super(message, "No internet: ");
}
