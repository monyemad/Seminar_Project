import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
