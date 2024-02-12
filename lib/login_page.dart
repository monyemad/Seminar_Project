import 'package:final_project/home_page.dart';
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
      key: formkey,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffCDFFD8), Color(0xff94B9FF)],
            stops: [0.2, 0.6],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            // transform: GradientRotation(13)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
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
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.grey.shade300)),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: const InputDecoration(
                      hintText: 'Enter your email address',
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
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.grey.shade300)),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: password,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                      ),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'password must not be empty';
                    } else if (value.isNotEmpty){
                      return 'password is incorrect';
                    }else{
                      return 'password must be 8 character';
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  minimumSize: const Size(200, 50),
                  padding: const EdgeInsets.all(12),
                  side: const BorderSide(
                      style: BorderStyle.solid, color: Colors.black12),
                  backgroundColor: Colors.orange.shade300,
                ),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  minimumSize: const Size(200, 50),
                  padding: const EdgeInsets.all(12),
                  side: const BorderSide(
                      style: BorderStyle.solid, color: Colors.black12),
                  backgroundColor: Colors.orange.shade300,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
                child: const Text(
                  'Guest',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
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
                                      onPressed: () {},
                                      child: const Text('Parent')),
                                  TextButton(
                                      onPressed: () {},
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
    );
  }
}
