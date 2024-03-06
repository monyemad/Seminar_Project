import 'package:final_project/layout/home_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool sec = true;
  bool tek = true;

  var visable = const Icon(Icons.visibility_rounded);
  var visableoff = const Icon(Icons.visibility_off_rounded);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(text: 'Email:'),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                hintText: 'Enter your email address',
                controller: email,
                prefixIcon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'email must not be empty';
                  } else if (value.isNotEmpty) {
                    return 'email is incorrect';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(text: 'Password:'),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                hintText: "Enter your password",
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.lock_rounded,
                // prefixIcon: const Icon(Icons.key_rounded),
                suffixIcon: IconButton(
                  icon: tek ? visableoff : visable,
                  onPressed: () {
                    setState(() {
                      tek = !tek;
                    });
                  },
                ),
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'password must not be empty';
                  } else if (value.isNotEmpty) {
                    return 'password is incorrect';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(text: 'Confirm password:'),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                hintText: "Enter your confirm password",
                controller: confirmpassword,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.lock_rounded,
                // prefixIcon: const Icon(Icons.key_rounded),
                suffixIcon: IconButton(
                  icon: tek ? visableoff : visable,
                  onPressed: () {
                    setState(() {
                      tek = !tek;
                    });
                  },
                ),
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'confirm password must not be empty';
                  } else if (value.isNotEmpty) {
                    return 'confirm password is incorrect';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  text: "Register",
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  })
            ],
          ),
        ],
      ),
    );
  }
}
