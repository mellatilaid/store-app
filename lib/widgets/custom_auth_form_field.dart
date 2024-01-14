import 'package:flutter/material.dart';

class CustomAuthTextField extends StatefulWidget {
  final String? labelText;

  final double verPadding;
  final Icon? suffixIcon;
  final Icon? preffixIcon;
  final bool isPassword;
  final TextInputType? textInputType;
  TextEditingController controller = TextEditingController();
  CustomAuthTextField({
    super.key,
    this.labelText,
    this.verPadding = 16,
    this.suffixIcon,
    this.preffixIcon,
    this.isPassword = false,
    required this.controller,
    this.textInputType,
  });

  @override
  State<CustomAuthTextField> createState() => _CustomAuthTextFieldState();
}

class _CustomAuthTextFieldState extends State<CustomAuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      controller: widget.controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field must be filled';
        } else {
          return null;
        }
      },
      obscureText: widget.isPassword ? true : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: widget.verPadding,
        ),
        prefixIcon: widget.preffixIcon,
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.green,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
