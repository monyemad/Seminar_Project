import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback function;
  final String text;
  final String label;

  const CustomDialog(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.function,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
        ),
        TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text(
                      "Register as....",
                      style: TextStyle(fontSize: 20),
                    ),
                    actions: [
                      TextButton(onPressed: onPressed, child: Text(text)),
                      TextButton(onPressed: function, child: Text(label)),
                    ],
                  );
                });
          },
          child: const Text(
            'Register Now',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
