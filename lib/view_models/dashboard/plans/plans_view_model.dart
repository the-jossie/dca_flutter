import 'dart:convert';

import 'package:dca_flutter/config/app_state.dart';
import 'package:stacked/stacked.dart';

import '../../../config/app_config.dart';
import '../../../models/plan.dart';
import '../../../services/plan_service.dart';
import '../../../set_up.dart';

class PlansViewModel extends BaseViewModel {
  AppState appState = AppState.none;

  List<Plan> plans = [];

  final PlanService _planService = locator<PlanService>();

  Future<void> fetchAllPlans() async {
    try {
      appState = AppState.loading;
      notifyListeners();

      final response = await _planService.getAllPlans();

      final jsonResponse = json.decode(response.body);

      plans = Plan.resolveList(jsonResponse['plans'] ?? []);

      appState = AppState.none;
      notifyListeners();
    } catch (e) {
      appState = AppState.error;
      notifyListeners();
      AppConfigService.errorSnackBar(e.toString());
    }
  }

  Future<void> togglePlan(Plan plan) async {
    try {
      await _planService.togglePlan(
        plan.id,
        {"isActive": !plan.isActive},
      );
      AppConfigService.successSnackBar("Plan successfully updated.");
    } catch (e) {
      AppConfigService.errorSnackBar(e.toString());
    }
    notifyListeners();
  }
}
