import 'dart:convert';

import 'package:http/http.dart';

import 'http_exception.dart';

class ApiError {
  static void checkResponse(Response response) {
    if (response.statusCode != 200 && response.statusCode != 201) {
      final data = json.decode(response.body);
      final message = data['msg'];
      switch (response.statusCode) {
        case 500:
          throw FetchDataException(message);
        case 400:
          throw BadRequestException(message);
        case 401:
        case 403:
          throw UnauthorisedException(message);
        case 404:
          throw DataNotFoundException(message);
        case 504:
          throw TimeOutException(message);
        case 503:
          throw ServiceUnavailable(message);
        default:
      }
    }
  }
}
