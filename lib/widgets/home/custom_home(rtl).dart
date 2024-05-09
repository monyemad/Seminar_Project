import 'package:flutter/material.dart';

class CustomHome2 extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final String text;

  const CustomHome2(
      {super.key,
      required this.onPressed,
      required this.image,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white30,
            child: CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.white38,
            ),
          ),
        ),
      ],
    );
  }
}
