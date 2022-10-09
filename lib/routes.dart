import 'view/auth_view.dart';
import 'view/dashboard/index.dart';
import 'view/dashboard/plans/create_plan.dart';
import 'view/dashboard/transactions/index.dart';
import 'view/dashboard/transactions/plan_transactions.dart';
import 'view/splash_view.dart';

final routes = {
  "splash_screen": (context) => const SplashView(),
  "auth": (context) => const AuthView(),
  "dashboard": (context) => const DashboardView(),
  "transactions": (context) => const TransactionsView(),
  "plan_transaction": (context) => const PlanTransactions(),
  "index": (context) => const DashboardView(),
  "create_plan": (context) => const CreatePlanView(),
};
