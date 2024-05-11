import 'package:flutter/material.dart';

class CustomTime extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomTime({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(style: BorderStyle.solid, color: Colors.black12),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: onPressed, icon: const Icon(Icons.timelapse_rounded)),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
