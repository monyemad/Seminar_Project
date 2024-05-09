import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final bool isObscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validate;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.isObscureText = false,
      required this.keyboardType,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(style: BorderStyle.solid, color: Colors.black12),
        ),
        child: TextFormField(
          keyboardType: keyboardType,
          obscureText: isObscureText,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon),
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black45,
              ),
              border: InputBorder.none),
          validator: validate,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}
