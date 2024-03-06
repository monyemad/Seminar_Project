import 'package:final_project/layout/home_page.dart';
import 'package:final_project/sign_in/parent_page.dart';
import 'package:final_project/sign_in/volunteer_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_dialog.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool sec = true;

  var visable = const Icon(Icons.visibility_rounded);
  var visableoff = const Icon(Icons.visibility_off_rounded);

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const CustomText(text: "Email:"),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    hintText: "Enter your email",
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_rounded,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(text: "Password:"),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    hintText: "Enter your password",
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock_rounded,
                    suffixIcon: IconButton(
                      icon: sec ? visableoff : visable,
                      onPressed: () {
                        setState(() {
                          sec = !sec;
                        });
                      },
                    ),
                    isObscureText: sec,
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
                    height: 30,
                  ),
                  CustomButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }));
                        }
                      },
                      text: 'Login'),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      },
                      text: 'Guest'),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomDialog(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return const ParentScreen();
                            }));
                      },
                      text: "Parent",
                      function: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return const VolunteerScreen();
                            }));
                      },
                      label: "Volunteer"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
