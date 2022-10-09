import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final bool status;

  const StatusBadge({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: status ? Colors.green : Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
