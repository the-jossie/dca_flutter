import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_client.dart';
import 'utils/jwt_tokens.dart';
import 'utils/storage.dart';

final locator = GetIt.instance;

Future<void> setUpGetIt() async {
  final sharedInstance = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(
    () => sharedInstance,
  );

  locator.registerLazySingleton<Storage>(
    () => Storage(),
  );

  locator.registerLazySingleton<JwtTokenUtil>(
    () => JwtTokenUtil(),
  );

  locator.registerLazySingleton<ApiClient>(
    () => ApiClient(),
  );
}
