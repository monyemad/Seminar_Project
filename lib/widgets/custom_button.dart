import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: MaterialButton(
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          color: Colors.orange.shade300,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
