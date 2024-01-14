import 'package:flutter/material.dart';

class WalletActionButton extends StatelessWidget {
  final IconData iconData;
  final String iconName;
  final VoidCallback onTap;
  const WalletActionButton({
    super.key,
    required this.iconData,
    required this.iconName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.white,
            side: const BorderSide(
              color: Colors.transparent,
            ),
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.5),
          ),
          child: Icon(
            iconData,
            color: Colors.blue,
            size: 32,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          iconName,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
