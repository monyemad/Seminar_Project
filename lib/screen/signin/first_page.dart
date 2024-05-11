import 'dart:async';

import 'package:final_project/screen/signin/login_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
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
    return const Scaffold(
      body: Stack(
        children: [
          CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/images/APP Logo.png'),
                  height: 220,
                  width: 220,
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
        ],
      ),
    );
  }
}
