import 'package:http/http.dart';

import '../api/api_client.dart';
import '../set_up.dart';

class PlanService {
  final ApiClient _client = locator<ApiClient>();

  Future<Response> getAllPlans() async {
    return _client.get(
      "plan/fetch_plans",
      auth: true,
    );
  }

  Future<Response> createPlan(Map data) async {
    return _client.post(
      "plan/create_plan",
      data,
      auth: true,
    );
  }

  Future<Response> editPlan(String id, Map data) async {
    return _client.put(
      "plan/edit_plan/$id",
      data,
      auth: true,
    );
  }

  Future<Response> togglePlan(String id, Map data) async {
    return _client.patch(
      "plan/toggle_plan/$id",
      data,
      auth: true,
    );
  }
}
