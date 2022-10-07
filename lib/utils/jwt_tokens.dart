import 'package:jwt_decoder/jwt_decoder.dart';

class JwtTokenUtil {
  Map<String, dynamic> decodeToken(String token) {
    return JwtDecoder.decode(token);
  }

  bool hasExpired(String? token) {
    if (token != null) {
      return JwtDecoder.isExpired(token);
    } else {
      return true;
    }
  }

  DateTime getExpirationDate(String token) {
    return JwtDecoder.getExpirationDate(token);
  }

  Duration tokenTime(String token) {
    return JwtDecoder.getTokenTime(token);
  }
}
