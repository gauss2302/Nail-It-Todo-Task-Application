import 'dart:io';

class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

String handleException(dynamic exception) {
  if (exception is FormatException) {
    return 'Invalid data format. Please check your input.';
  } else if (exception is PathAccessException) {
    return 'Unable to load storage';
  } else {
    return 'An unexpected error occurred. Please try again later.';
  }
}
