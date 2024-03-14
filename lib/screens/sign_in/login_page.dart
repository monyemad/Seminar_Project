import 'package:final_project/screens/layout/home_page.dart';
import 'package:final_project/screens/sign_in/password/forgot_pwd_page.dart';
import 'package:final_project/screens/sign_in/register_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
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
              child: Center(
                child: SingleChildScrollView(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const ForgotPasswordScreen();
                                    }));
                              },
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const RegisterScreen();
                                  }));
                            },
                            child: const Text(
                              'Register Now',
                              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
