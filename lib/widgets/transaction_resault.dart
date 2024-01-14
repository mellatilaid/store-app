import 'package:flutter/material.dart';

import '../widgets/custom_text_button.dart';

class TransactionResaultDialage extends StatelessWidget {
  final String content;
  const TransactionResaultDialage({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 80,
        child: Center(
          child: Text(
            content,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: [
        CustomTextButton(
          onTap: () {
            Navigator.pop(context);
          },
          actionText: 'ok',
        ),
      ],
    );
  }
}
