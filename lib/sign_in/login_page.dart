import 'package:final_project/layout/home_page.dart';
import 'package:final_project/sign_in/parent_page.dart';
import 'package:final_project/sign_in/volunteer_page.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffCDFFD8), Color(0xff94B9FF)],
            stops: [0.2, 0.6],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
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
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Email:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
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
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: const InputDecoration(
                          hintText: 'Enter your email address',
                          prefixIcon: Icon(Icons.email_rounded),
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty';
                        }else if (value.isNotEmpty){
                          return 'email is incorrect';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                // CustomTextFormField(
                //   hintText: "Enter your email",
                //   controller: email,
                //   keyboardType: TextInputType.emailAddress,
                //   prefixIcon: Icons.email_rounded,
                // ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Password:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    hintText: "Enter your password",
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock_rounded,
                  suffixIcon: Icons.remove_red_eye_rounded,
                  isObscureText: true,
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                    ),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: const Text(
                                    "Register as....",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                    return const ParentScreen();
                                                  }));
                                        },
                                        child: const Text('Parent')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                    return const VolunteerScreen();
                                                  }));
                                        },
                                        child: const Text('Volunteer')),
                                  ],
                                );
                              });
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
