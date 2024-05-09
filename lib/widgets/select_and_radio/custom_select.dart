import 'package:flutter/material.dart';

class CustomSelect extends StatelessWidget {
  final Function(dynamic) onChanged;
  final List<String> items;
  final String text;
  final String? value;

  const CustomSelect(
      {super.key,
      required this.onChanged,
      required this.items,
      required this.text,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white30,
          border: Border.all(style: BorderStyle.solid, color: Colors.black12),
          borderRadius: BorderRadius.circular(20)),
      child: DropdownButton(
        underline: const Divider(
          endIndent: 4,
          indent: 4,
        ),
        isExpanded: true,
        hint: Text(
          text,
          style: const TextStyle(
            // fontSize: 15,
            color: Colors.black45,
          ),
        ),
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}
