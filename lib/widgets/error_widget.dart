import 'package:flutter/material.dart';

import '../../formatters/num.dart';
import '../config/app_config.dart';
import 'button.dart';

class ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback reload;

  const ErrorWidget({
    Key? key,
    required this.message,
    required this.reload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          DCAButton(
            width: 40.w,
            color: AppConfigService.hexToColor("#ffb300"),
            onPressed: reload,
            child: const Text(
              'Reload',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
