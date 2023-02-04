class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(this._message, this._prefix);
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? meesage])
      : super(meesage, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? meesage]) : super(meesage, 'Invalid Request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? meesage])
      : super(meesage, 'Unauthorised Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? meesage]) : super(meesage, 'Invalid Input');
}
