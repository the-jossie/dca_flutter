import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_client.dart';
import 'services/auth_service.dart';
import 'services/market_service.dart';
import 'services/plan_service.dart';
import 'utils/jwt_tokens.dart';
import 'utils/storage.dart';

final locator = GetIt.instance;

Future<void> setUpServiceLocator() async {
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

  locator.registerLazySingleton<AuthService>(
    () => AuthService(),
  );

  locator.registerLazySingleton<PlanService>(
    () => PlanService(),
  );

  locator.registerLazySingleton<MarketService>(
    () => MarketService(),
  );
}
