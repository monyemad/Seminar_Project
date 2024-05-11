import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomPop(bottom: 70,),
              const CustomProfileImg(
                icon: Icons.edit_rounded,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: 'Name',
                controller: name,
                keyboardType: TextInputType.name,
                prefixIcon: Icons.person_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Email',
                controller: email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Phone number',
                controller: phone,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Gender',
                controller: gender,
                keyboardType: TextInputType.text,
                prefixIcon: Icons.face,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'BirthDate',
                controller: birth,
                keyboardType: TextInputType.datetime,
                prefixIcon: Icons.cake_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
