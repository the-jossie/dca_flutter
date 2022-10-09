import 'dart:convert';

import 'package:stacked/stacked.dart';

import '../../../config/app_config.dart';
import '../../../config/app_state.dart';
import '../../../models/transaction.dart';
import '../../../services/transaction_service.dart';
import '../../../set_up.dart';

class TransactionsViewModel extends BaseViewModel {
  final TransactionService _transactionService = locator<TransactionService>();

  List<Transaction> transaction = [];

  AppState appState = AppState.none;

  Future<void> fetchAllTransactionAction() async {
    try {
      appState = AppState.loading;
      notifyListeners();

      final response = await _transactionService.fetchAllTransaction();

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
