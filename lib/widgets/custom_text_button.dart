import 'package:flutter/material.dart';

import '../helper/const.dart';

class CustomTextButton extends StatelessWidget {
  final String actionText;
  final VoidCallback onTap;
  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        actionText,
        style: const TextStyle(
          color: kPrimary,
        ),
      ),
    );
  }
}
