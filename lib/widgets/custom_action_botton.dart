import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String iconName;
  final Color? backGroundColor;
  final VoidCallback onTap;
  const CustomActionButton(
      {super.key,
      required this.iconName,
      this.backGroundColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 18),
      width: double.infinity,
      height: 80,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(215, 48),
          ),
          onPressed: onTap,
          child: Text(
            iconName,
          )),
    );
  }
}
