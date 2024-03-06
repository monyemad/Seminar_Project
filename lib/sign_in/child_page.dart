import 'package:final_project/sign_in/register_page.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_gender.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class ChildScreen extends StatefulWidget {
  const ChildScreen({super.key});

  @override
  State<ChildScreen> createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  TextEditingController picture = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController current = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController government = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffCDFFD8), Color(0xff94B9FF)],
                stops: [0.2, 0.6],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Fill in the data",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Child information",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Divider(
                thickness: 1.5,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(text: 'Child Name:'),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(hintText: "Enter your Child Name",
                controller: name,
                keyboardType: TextInputType.name,),
              const SizedBox(
                height: 20,
              ),
              const CustomText(text: 'Child Picture:'),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo_rounded,
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Import image',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(text: 'Birth certificate:'),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                hintText: "Enter your Child Birth certificate",
                controller: birth,
                keyboardType: TextInputType.number,),
              const SizedBox(
                height: 20,
              ),
              const CustomGender(),
              const SizedBox(
                height: 20,
              ),
              const CustomText(text: 'Age:'),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(hintText: "Enter your Child age",
                controller: age,
                keyboardType: TextInputType.number,),
              const SizedBox(
                height: 20,
              ),
              const CustomText(text: 'Current Age:'),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(hintText: "Enter your Child current age",
                controller: current,
                keyboardType: TextInputType.number,),
              const SizedBox(
                height: 20,
              ),
              const CustomText(text: 'Government:'),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(hintText: "Enter your Government",
                  controller: government,
                  keyboardType: TextInputType.text,),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      }));
                },
                text: 'Submit',
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
