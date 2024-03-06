import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isObscureText;
  final TextInputType keyboardType;
  final void Function()? validate;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.isObscureText = false,
      required this.keyboardType,
      this.validate
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                style: BorderStyle.solid, color: Colors.grey.shade300)),
        padding: const EdgeInsets.only(left: 6,right: 6),
        child: TextFormField(
          keyboardType: keyboardType,
          obscureText: isObscureText,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon),
              suffixIcon: Icon(suffixIcon),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black45,
              ),
              border: InputBorder.none),
          // validator: validate,
        ),
      ),
    );
  }
}
