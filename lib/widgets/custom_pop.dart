import 'package:flutter/material.dart';

class CustomPop extends StatelessWidget {
  const CustomPop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 45, bottom: 8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: const BorderSide(
                  style: BorderStyle.solid, color: Colors.black12),
              backgroundColor: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          )),
    );
  }
}
