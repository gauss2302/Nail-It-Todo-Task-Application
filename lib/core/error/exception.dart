class AppException implements Exception {
  final String message;
  AppException({required this.message});

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException({required super.message});
}

class NetworkException extends AppException {
  NetworkException({required super.message});
}

class CacheException extends AppException {
  CacheException({required super.message});
}

class BadRequestException extends AppException {
  BadRequestException({required super.message});
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required super.message});
}

class ForbiddenException extends AppException {
  ForbiddenException({required super.message});
}

class NotFoundException extends AppException {
  NotFoundException({required super.message});
}

class ConflictException extends AppException {
  ConflictException({required super.message});
}

class RequestCancelledException extends AppException {
  RequestCancelledException({required super.message});
}
