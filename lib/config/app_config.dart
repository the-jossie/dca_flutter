import 'package:flutter/material.dart';

import '../extension/num.dart';

class AppConfigService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final textVeryLarge = TextStyle(fontSize: 8.text);

  static final textLarge = TextStyle(fontSize: 7.5.text);
  static final textMedium = TextStyle(fontSize: 6.5.text);
  static final headline = TextStyle(fontSize: 5.7.text);
  static final headline2 = TextStyle(fontSize: 4.text);
  static final subTitle = TextStyle(fontSize: 3.5.text);
  static final small = TextStyle(fontSize: 3.2.text);
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static void successSnackBar(String message) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        elevation: 0.0,
        margin: EdgeInsets.only(
          bottom: 75.h,
          right: 20,
          left: 20,
        ),
        backgroundColor: hexToColor("#494FB1"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void errorSnackBar(String message, {int? duration}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
        margin: EdgeInsets.only(
          bottom: 75.h,
          right: 20,
          left: 20,
        ),
        duration: const Duration(seconds: 2),
        elevation: 0.0,
        backgroundColor: hexToColor("#ea001e"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void bottomSheet(Widget child, bool isScrollControlled) {
    showModalBottomSheet<void>(
      context: navigatorKey.currentContext!,
      isScrollControlled: isScrollControlled,
      clipBehavior: Clip.antiAlias,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  static Future<T?>? pushNamed<T>(
    String route, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamed<T>(
      route,
      arguments: arguments,
    );
  }

  static Future<T?>? offNamed<T>(
    String route, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  static void back<T>({
    T? result,
  }) {
    navigatorKey.currentState?.pop(result);
  }

  static Future<T?>? offAllNamed<T>(
    String route, {
    RoutePredicate? predicate,
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
      route,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }
}
