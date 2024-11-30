import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextformfield extends StatelessWidget {
  CustomTextformfield({
    super.key,
    required this.txt,
    this.textController,
    required this.keyboardType,
    required this.secureText,
    this.onChanged,
  });
  final String txt;
  final bool secureText;
  Widget? suffixIcon;
  TextEditingController? textController;
  final TextInputType keyboardType;
  Function(String)? onChanged;
  // String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secureText,
      controller: textController,
      onChanged: onChanged,
      // validator: validator,
      keyboardType: keyboardType,
      style: const TextStyle(
        // color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
        hintText: txt,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}
