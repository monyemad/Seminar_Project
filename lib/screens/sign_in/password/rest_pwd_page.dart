import 'package:final_project/screens/sign_in/password/success_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _RestPasswordScreenState();
}

class _RestPasswordScreenState extends State<ResetPasswordScreen> {
  bool sec = true;
  bool tek = true;

  var visable = const Icon(Icons.visibility_rounded);
  var visableoff = const Icon(Icons.visibility_off_rounded);

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 85),
                      child: Text(
                        "Please, enter a new\npassword below.",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomText(text: 'New Password:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your new password",
                      controller: password,
                      isObscureText: tek,
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
                          return 'new password must not be empty';
                        } else if (value.isNotEmpty) {
                          return 'new password is incorrect';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Confirm new password:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your confirm new password",
                      controller: confirmpassword,
                      isObscureText: sec,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock_rounded,
                      // prefixIcon: const Icon(Icons.key_rounded),
                      suffixIcon: IconButton(
                        icon: sec ? visableoff : visable,
                        onPressed: () {
                          setState(() {
                            sec = !sec;
                          });
                        },
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'confirm new password must not be empty';
                        } else if (value.isNotEmpty) {
                          return 'confirm new password is incorrect';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                        text: "Save",
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const SuccessScreen();
                              }));
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
