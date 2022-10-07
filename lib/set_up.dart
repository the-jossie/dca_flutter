import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_client.dart';
import 'utils/jwt_tokens.dart';
import 'utils/storage.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  final sharedInstance = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(
    () => sharedInstance,
  );

  getIt.registerLazySingleton<Storage>(
    () => Storage(),
  );

  getIt.registerLazySingleton<JwtTokenUtil>(
    () => JwtTokenUtil(),
  );

  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(),
  );
}
