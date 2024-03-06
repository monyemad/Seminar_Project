import 'package:flutter/material.dart';

class CustomSetting extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback function;

  const CustomSetting(
      {super.key,
      required this.onPressed,
      required this.function,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Log out',
          style: TextStyle(fontSize: 25),
        ),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text(
                        "Are you sure?",
                        style: TextStyle(fontSize: 25),
                      ),
                      actions: [
                        TextButton(
                            onPressed: onPressed,
                            child: const Text('YES')),
                        TextButton(
                            onPressed: function,
                            child: const Text('NO')),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.logout_rounded)),
      ],
    );
  }
}
