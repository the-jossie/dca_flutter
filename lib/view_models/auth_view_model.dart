import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../config/app_state.dart';

class AuthViewModel extends BaseViewModel {
  AppState appState = AppState.none;

  int currentPageIndex = 0;
  final pageController = PageController(initialPage: 0);

  final TextEditingController _secretKeyTextController =
      TextEditingController();

  TextEditingController get secretKeyTextController => _secretKeyTextController;

  final syncAccountFormKey = GlobalKey<FormState>();

  void changePageIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  Future<void> handleSyncAccount(String secretKey) async {
    try {
      appState = AppState.loading;
      notifyListeners();

      final Map<String, String> data = {
        "secretKey": secretKey,
      };
    } catch (e) {}
  }
}
