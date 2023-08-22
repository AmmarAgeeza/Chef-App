import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class BadResposneException extends ServerException {
  BadResposneException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class FetchDataException extends ServerException {
  FetchDataException(super.messageModel);
}

class BadRequestException extends ServerException {
  BadRequestException(super.messageModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.messageModel);
}
class ForbiddenException extends ServerException {
  ForbiddenException(super.messageModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.messageModel);
}

class ConflictException extends ServerException {
  ConflictException(super.messageModel);
}
class CancleExeption extends ServerException {
  CancleExeption(super.messageModel);
}
