import 'package:flutter/material.dart';

class LoaidngTransaction extends StatelessWidget {
  final String content;
  const LoaidngTransaction({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 30,
        width: 30,
        child: Center(child: CircularProgressIndicator()));
  }
}
