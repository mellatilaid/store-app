import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final Function(String)? onSubmetted;
  final double verPadding;
  final Icon? suffixIcon;
  final Icon? preffixIcon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    this.labelText,
    this.inputType,
    this.onChanged,
    this.hintText,
    this.verPadding = 16,
    this.onSubmetted,
    this.suffixIcon,
    this.preffixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmetted,
      onChanged: onChanged,
      keyboardType: inputType,
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: verPadding,
        ),
        prefixIcon: preffixIcon,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
