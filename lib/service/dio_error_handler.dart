import 'package:dio/dio.dart';

String dioErrorHandler(DioException e) {
  final statusCode = e.error;
  final reasonPhrase = e.message;

  final errorMessage =
      'Request failed\nStatus Code: $statusCode\nReason: $reasonPhrase';

  return errorMessage;
}
