import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Icon prefixIcon;
  final Function(String) onChanged;
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    required this.onChanged,
    this.validator,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        color: Color(0xff222222),
        fontFamily: "Montserrat",
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: Colors.black,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        isDense: true,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(fontStyle: FontStyle.italic),
        contentPadding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 12,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent.shade700,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black.withAlpha(33), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.redAccent.shade700, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.redAccent.shade700, width: 2.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.orange, width: 2.5),
        ),
      ),
    );
  }
}
