import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final String text;
  final String data;
  const CustomProfile({super.key, required this.text, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.black,
        ),
      ),
      child: ListTile(
        style: ListTileStyle.list,
        title: Text(
          text
        ),
        leading: Text(
          data,
          style:
          const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
