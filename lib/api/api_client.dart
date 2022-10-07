import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../utils/storage.dart';
import 'constants.dart' as consts;
import '../set_up.dart';
import 'api_errors.dart';
import 'http_exception.dart';

class ApiClient {
  Storage storage = getIt<Storage>();

  Future<http.Response> get(
    String url, {
    bool auth = false,
    baseUrl = consts.baseUrl,
  }) async {
    try {
      String? value = storage.getString("token");
      Map<String, String> headers = {...consts.headers};
      if (auth) {
        headers['authorization'] = "Bearer $value";
      }
      final response = await http.get(
        Uri.parse("$baseUrl$url"),
        headers: headers,
      );
      ApiError.checkResponse(response);
      return response;
    } on SocketException {
      throw NoInternetException(
        "You seem not to be connected to the internet.",
      );
    }
  }

  Future<http.Response> post(
    String url,
    Map body, {
    bool auth = false,
    baseUrl = consts.baseUrl,
  }) async {
    try {
      Map<String, String> headers = {...consts.headers};
      String? value = storage.getString("token");
      if (auth) {
        headers['authorization'] = "Bearer $value";
      }

      final response = await http.post(
        Uri.parse("$baseUrl$url"),
        body: json.encode(body),
        headers: headers,
      );
      ApiError.checkResponse(response);
      return response;
    } on SocketException {
      throw NoInternetException(
        "You seem not to be connected to the internet.",
      );
    }
  }

  Future<http.Response> put(
    String url,
    Map body, {
    bool auth = false,
    baseUrl = consts.baseUrl,
  }) async {
    try {
      Map<String, String> headers = {...consts.headers};
      String? value = storage.getString("token");
      if (auth) {
        headers['authorization'] = "Bearer $value";
      }
      final response = await http.put(
        Uri.parse("$baseUrl$url"),
        body: json.encode(body),
        headers: headers,
      );
      ApiError.checkResponse(response);
      return response;
    } on SocketException {
      throw NoInternetException(
        "You seem not to be connected to the internet.",
      );
    }
  }

  Future<http.Response> patch(
    String url,
    Map body, {
    bool auth = false,
    baseUrl = consts.baseUrl,
  }) async {
    try {
      Map<String, String> headers = {...consts.headers};
      String? value = storage.getString("token");
      if (auth) {
        headers['authorization'] = "Bearer $value";
      }
      final response = await http.patch(
        Uri.parse("$baseUrl$url"),
        body: json.encode(body),
        headers: headers,
      );
      ApiError.checkResponse(response);
      return response;
    } on SocketException {
      throw NoInternetException(
        "You seem not to be connected to the internet.",
      );
    }
  }
}
