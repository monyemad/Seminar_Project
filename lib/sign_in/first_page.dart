import 'dart:async';

import 'package:final_project/sign_in/login_page.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ),
    );
  }

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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/images/APP Logo.png'),
                height: 240,
                width: 240,
              ),
            ),
            Text(
              'Sa3dni',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                // color: Colors.deepPurple
              ),
            ),
          ],
        ),
      ),
    );
  }
}
