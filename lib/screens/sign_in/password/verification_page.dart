import 'package:final_project/screens/sign_in/password/otp_code_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
                  const Image(image: AssetImage("assets/images/sent.png")),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Verify code \n has been sent',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Verify code has been sent\n check your email address',
                  style: TextStyle(
                    color: Colors.black54,
                  ),),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                      text: "Verify",
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return const OtpCodeScreen();
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
