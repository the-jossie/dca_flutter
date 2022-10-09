import 'package:http/http.dart';

import '../api/api_client.dart';
import '../set_up.dart';

class TransactionService {
  final ApiClient _client = locator<ApiClient>();

  Future<Response> fetchPlanTransaction(String id) async {
    return _client.get(
      "transaction/transactions/$id",
      auth: true,
    );
  }

  Future<Response> fetchAllTransaction() async {
    return _client.get(
      "transaction",
      auth: true,
    );
  }
}
