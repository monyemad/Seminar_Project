import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final String text;
  final String title;
  final String value;
  final String? groupValue;
  final Function(dynamic) onChange;
  final String title1;
  final String value1;

  const CustomRadio(
      {super.key,
      required this.text,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.title1,
      required this.value1,
      required this.onChange,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 4),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.black12),
                      color: Colors.white30),
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    title: Text(title),
                    value: value,
                    groupValue: groupValue,
                    onChanged: onChange,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.black12),
                      color: Colors.white30),
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    title: Text(title1),
                    value: value1,
                    groupValue: groupValue,
                    onChanged: onChange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
