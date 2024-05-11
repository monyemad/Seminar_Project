import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconButton prefixIcon;
  final TextInputType keyboardType;
  // final String? Function(String?)? validate;

  const CustomDate(
      {super.key,
      required this.hintText,
      this.controller,
      required this.prefixIcon,
      required this.keyboardType,
       // this.validate
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.black12),
              ),
              child: TextFormField(
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                    prefixIcon: prefixIcon,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    border: InputBorder.none),
                // validator: validate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
