import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final String text;
  const CustomButtonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
