import 'views/authentication.dart';
import 'views/splash.dart';

final routes = {
  "splash_screen": (context) => const SplashView(),
  "sync_account": (context) => const AuthenticationView(),
};
