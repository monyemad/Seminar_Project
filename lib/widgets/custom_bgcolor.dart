import 'package:flutter/material.dart';

class CustomBgColor extends StatelessWidget {
  const CustomBgColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffE3F3F7),
            Color(0xffD1EAF0),
            Color(0xffBBDBFF),
            Color(0xffE5D4FF),
            Color(0xffDCBFFF),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
      ),);
  }
}