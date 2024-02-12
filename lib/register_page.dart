import 'package:final_project/login_page.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController username = TextEditingController();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Email:",
                style: TextStyle(
                  fontSize: 25,
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
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                    border: InputBorder.none),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email must not be empty';
                  } else if (value.isNotEmpty){
                    return 'email is incorrect';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Password:",
                style: TextStyle(
                  fontSize: 25,
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
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                    border: InputBorder.none),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password must not be empty';
                  } else if (value.isNotEmpty){
                    return 'password is incorrect';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Confirm password:",
                style: TextStyle(
                  fontSize: 25,
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
                controller: confirmpassword,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    hintText: 'Enter your confirm password',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                    border: InputBorder.none),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'confirm password must not be empty';
                  } else if (value.isNotEmpty){
                    return 'confirm password is incorrect';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                minimumSize: const Size(250, 50),
                padding: const EdgeInsets.all(12),
                side: const BorderSide(
                    style: BorderStyle.solid, color: Colors.black12),
                backgroundColor: Colors.orange.shade300,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
