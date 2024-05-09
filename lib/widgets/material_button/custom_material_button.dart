import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomMaterialButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 12,
        padding: const EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    color: const Color(0xff0C359E),
    onPressed: onPressed);
  }
}
