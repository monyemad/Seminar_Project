import 'package:flutter/material.dart';

class CustomSupport extends StatelessWidget {
  final String text;
  final String text1;
  final IconData iconData;
  final VoidCallback? onPressed;
  final VoidCallback? function;

  const CustomSupport(
      {super.key,
      required this.text,
      required this.text1,
      required this.iconData,
      this.onPressed,
      this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white70,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: Colors.red,
            onPressed: onPressed,
            icon: Icon(iconData),
          ),
          // SizedBox(height: 6,),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          SizedBox(height: 6,),
          TextButton(
            onPressed: function,
            child: Text(text1,
                style: const TextStyle(
                  color: Color(0xff0C359E),
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
