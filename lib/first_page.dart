import 'package:final_project/login_page.dart';
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
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(const Duration(milliseconds: 1600), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>
           const LoginScreen()
        ));
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
            // const SizedBox(
            //   height: 30,
            // ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     alignment: Alignment.center,
            //     minimumSize: const Size(250, 50),
            //     padding: const EdgeInsets.all(12),
            //     side: const BorderSide(
            //         style: BorderStyle.solid, color: Colors.black12),
            //     backgroundColor: Colors.orange.shade300,
            //   ),
            //   onPressed: () {},
            //   child: const Text(
            //     'Language',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 25,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
