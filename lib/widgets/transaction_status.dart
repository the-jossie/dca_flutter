import 'package:flutter/material.dart';

class TransactionStatus extends StatelessWidget {
  final String status;

  const TransactionStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: status == "DONE"
            ? Colors.green
            : status == "CONFIRM"
                ? Colors.blue
                : Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}

class TransactionStatusText extends StatelessWidget {
  final String status;
  final String title;

  const TransactionStatusText({
    Key? key,
    required this.status,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: status == "DONE"
            ? Colors.green
            : status == "CONFIRM"
                ? Colors.blue
                : Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
