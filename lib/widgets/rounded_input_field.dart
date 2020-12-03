import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final TextInputType keyboardType;
  final String hint;
  final ValueChanged<String> onChanged;
  final Color color;
  final bool isObscured;

  RoundedInputField(
      {this.keyboardType = TextInputType.text,
      this.hint,
      this.onChanged,
      this.color,
      this.isObscured = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      obscureText: isObscured,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
