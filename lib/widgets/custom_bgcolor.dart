import 'package:flutter/material.dart';

class CustomBgColor extends StatelessWidget {
  const CustomBgColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffCDFFD8), Color(0xff94B9FF)],
          stops: [0.2, 0.6],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
      ),);
  }
}
