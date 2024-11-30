import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.tap,
    required this.txt,
  });
  final VoidCallback tap;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.teal,
          ),
          child: Center(
              child: Text(
            txt,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ))),
    );
  }
}
