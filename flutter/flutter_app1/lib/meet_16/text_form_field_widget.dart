import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    required this.onChanged,
    this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter some text";
        }
        return null;
      },
      obscureText: obscureText ?? false,
      style: TextStyle(
        color: Color(0xff222222),
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: Colors.black,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white.withAlpha(127),
        hintStyle: TextStyle(fontStyle: FontStyle.italic),
        contentPadding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 12,
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black.withAlpha(33)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.red, width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Color(0xffF34B1B).withAlpha(100),
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
