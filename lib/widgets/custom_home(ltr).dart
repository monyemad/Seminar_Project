import 'package:flutter/material.dart';

class CustomHome extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final String text;

  const CustomHome({super.key,
    required this.onPressed,
    required this.image,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: onPressed,
          child: CircleAvatar(
            radius: 83,
            backgroundColor: Colors.white12,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white30,
              child: CircleAvatar(
                radius: 75,
                backgroundImage:
                AssetImage(image),
                backgroundColor: Colors.white38,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
