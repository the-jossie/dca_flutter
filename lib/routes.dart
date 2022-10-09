import 'view/auth_view.dart';
import 'view/dashboard/index.dart';
import 'view/splash_view.dart';

final routes = {
  "splash_screen": (context) => const SplashView(),
  "auth": (context) => const AuthView(),
  "dashboard": (context) => const DashboardView(),
};
