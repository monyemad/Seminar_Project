import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screens/layout/home_page.dart';
import 'package:final_project/screens/sign_in/password/forgot_pwd_page.dart';
import 'package:final_project/screens/sign_in/register_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _responseData = '';

  Future<void> loginData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://sa3edny-backend-nodejs.onrender.com/user/userLogin'));
      if (response.statusCode == 201) {
        Map<String, dynamic> userLogin = json.decode(response.body);
        setState(() {
          _responseData = userLogin['key'];
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
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
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
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
                          } else if (value.length < 6) {
                            return 'password must be 8 numbers or letters';
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is LoginErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.error,
                                ),
                              ),
                            );
                          } else if (state is LoginDoneState) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                                  return const HomeScreen();
                                }));
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            width: 250,
                            child: MaterialButton(
                              elevation: 12,
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: const Color(0xff0C359E),
                              onPressed: loginData,
                              //     () async {
                              //   if (formkey.currentState!.validate()) {
                              //     await context.read<AppCubitA>().loginData();
                              //   }
                              // },
                              child: state is LoginLoadingState
                                  ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                                  : const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(_responseData),
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const RegisterScreen();
                                  }));
                            },
                            child: const Text(
                              'Register Now',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
