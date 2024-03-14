import 'package:flutter/material.dart';

class CustomPop extends StatelessWidget {
  final double bottom;
  final double? top;

  const CustomPop({super.key,
    required this.bottom,
    this.top
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 40, bottom: bottom),
      child: MaterialButton(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
    );
  }
}
