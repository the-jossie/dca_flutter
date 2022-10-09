import 'dart:convert';

import 'package:stacked/stacked.dart';

import '../../../config/app_config.dart';
import '../../../config/app_state.dart';
import '../../../models/transaction.dart';
import '../../../services/transaction_service.dart';
import '../../../set_up.dart';

class TransactionViewModel extends BaseViewModel {
  AppState appState = AppState.none;

  late String transactionID;
  late String planName;

  List<Transaction> transaction = [];

  final TransactionService _planTransactionService =
      locator<TransactionService>();

  void assignArguments(Map<String, dynamic> data) {
    transactionID = data['transaction_id'];
    planName = data['plan_name'];
  }

  Future<void> fetchTransactions() async {
    try {
      appState = AppState.loading;
      notifyListeners();

      final response =
          await _planTransactionService.fetchPlanTransaction(transactionID);

      final jsonResponse = json.decode(response.body);
      transaction = Transaction.resolveList(jsonResponse['transactions'] ?? []);

      appState = AppState.none;
      notifyListeners();
    } catch (e) {
      appState = AppState.error;
      notifyListeners();

      AppConfigService.errorSnackBar(e.toString());
    }
  }
}
