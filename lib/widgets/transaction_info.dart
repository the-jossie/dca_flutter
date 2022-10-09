import 'package:flutter/material.dart';

import '../../formatters/num.dart';

class TransactionInfo extends StatelessWidget {
  final Widget widgetKey;
  final Widget value;

  const TransactionInfo({
    Key? key,
    required this.widgetKey,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          widgetKey,
          const Spacer(),
          value,
        ],
      ),
    );
  }
}
