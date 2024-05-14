import 'package:final_project/screen/signin/password/reset_password_page.dart';
import 'package:final_project/screen/volunteer/volunteer_reset_page.dart';
import 'package:final_project/widgets/form_field/custom_button.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class VolunteerForgotPasswordScreen extends StatefulWidget {
  const VolunteerForgotPasswordScreen({super.key});

  @override
  State<VolunteerForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<VolunteerForgotPasswordScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'@');
    final isEmailValid =emailRegex.hasMatch(email ?? '');
    if(!isEmailValid){
      return'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomPop(
                    bottom: 0,
                  ),
                  const Image(
                    image: AssetImage('assets/images/forgot.png'),
                    height: 350,
                    width: 350,
                  ),
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please,enter your email address below\n to receive your user and a new password',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const CustomText(text: 'Email:'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'example@gmail.com',
                    controller: email,
                    prefixIcon: Icons.email_rounded,
                    keyboardType: TextInputType.emailAddress,
                    validate: validateEmail,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return VolunteerResetPasswordScreen(
                                email:email.text,
                              );
                            }));
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}