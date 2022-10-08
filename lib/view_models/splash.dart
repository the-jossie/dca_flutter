import 'package:stacked/stacked.dart';

import '../config/app_config.dart';
import '../set_up.dart';
import '../utils/jwt_tokens.dart';
import '../utils/storage.dart';

class SplashViewModel extends BaseViewModel {
  final Storage _storage = getIt<Storage>();

  final JwtTokenUtil _jwtTokenUtil = getIt<JwtTokenUtil>();

  Future<void> init() async {
    final String? userToken = _storage.getString("token");

    await Future.delayed(const Duration(seconds: 4)).then((value) async {
      if (_jwtTokenUtil.hasExpired(userToken)) {
        await _storage.removeKey("token");
        AppConfigService.offAllNamed("auth");
      } else {
        AppConfigService.offAllNamed("index");
      }
    });
  }
}
