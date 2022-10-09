
import 'dart:convert';

import 'package:dca_flutter/config/app_config.dart';
import 'package:dca_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../config/app_state.dart';
import '../set_up.dart';
import '../utils/storage.dart';

class AuthViewModel extends BaseViewModel {
  AppState appState = AppState.none;

  final AuthService _authService = locator<AuthService>();

  final Storage _storage = locator<Storage>();

  int currentPageIndex = 0;
  final pageController = PageController(initialPage: 0);

  final TextEditingController _secretKeyTextController =
      TextEditingController();
  final TextEditingController _otpTextController = TextEditingController();

  TextEditingController get secretKeyTextController => _secretKeyTextController;
  TextEditingController get otpTextController => _otpTextController;

  final syncAccountFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();

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

      await _authService.syncAccount(data);

      appState = AppState.none;
      notifyListeners();

      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      appState = AppState.error;
      notifyListeners();

      AppConfigService.errorSnackBar(e.toString());
    }
  }

  Future<void> authenticateAccount(String code) async {
    try {
      appState = AppState.loading;
      notifyListeners();

      final Map<String, String> data = {
        "code": code,
      };

      final response = await _authService.authenticate(data);

      final jsonDecoded = json.decode(response.body);
      String returnedToken = jsonDecoded['data']['user']['token'];

      await _storage.setString("token", returnedToken);

      AppConfigService.offAllNamed("dashboard");
      appState = AppState.none;
    } catch (e) {
      appState = AppState.error;
      notifyListeners();

      AppConfigService.errorSnackBar(e.toString());
    }
  }
}
