import 'package:http/http.dart';

import '../api/api_client.dart';
import '../set_up.dart';

class AuthService {
  final ApiClient _client = getIt<ApiClient>();

  Future<Response> syncAccount(Map data) async {
    return _client.post("user/syncAccount", data);
  }

  Future<Response> authenticate(Map data) async {
    return _client.post(
      "user/authenticate",
      data,
    );
  }
}
