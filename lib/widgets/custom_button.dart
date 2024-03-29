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
      width: 250,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            // BoxShadow(
            //   color: Colors.black38,
            //   offset: Offset(4,4),
            //   blurRadius: 14,
            //   spreadRadius: 1.0
            // ),
            // BoxShadow(
            //   color: Colors.white38,
            //   offset: Offset(-4,-4),
            //   blurRadius: 14,
            //   spreadRadius: 1.0
            // ),
          ],
        ),
        child: MaterialButton(
          elevation: 12,
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Color(0xff0C359E),
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
      ),
    );
  }
}
