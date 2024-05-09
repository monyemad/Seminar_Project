import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/custom_image.dart';
import 'package:final_project/widgets/text-field.dart';
import 'package:flutter/material.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomPop(
                  bottom: 70,
                ),
                const CustomProfileImg(
                  icon: Icons.edit_rounded,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    label: 'User Name:', text: name.text, onChanged: (name) {}),
                const SizedBox(
                  height: 25,
                ),
                TextFieldWidget(
                    label: 'Email:', text: email.text, onChanged: (email) {}),
                const SizedBox(
                  height: 25,
                ),
                TextFieldWidget(
                    label: 'Phone:', text: phone.text, onChanged: (phone) {}),
                const SizedBox(
                  height: 25,
                ),
                TextFieldWidget(
                    label: 'Age:', text: age.text, onChanged: (age) {}),
                const SizedBox(
                  height: 25,
                ),
                TextFieldWidget(
                    label: 'Gender:', text: gender.text, onChanged: (gender) {}),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
