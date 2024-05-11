import 'package:final_project/screen/signin/password/Reset_password_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Verification Code',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Please, Enter the digit code sent to your email',
                    style: TextStyle(
                      color: Colors.black54,
                    ),),
                  const SizedBox(height: 40,),
                  OtpTextField(
                    borderRadius: BorderRadius.circular(14),
                    numberOfFields: 6,
                    enabledBorderColor: Colors.white38,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    // onSubmit: (String verificationCode) {
                    //   Navigator.pushReplacement(context,
                    //       MaterialPageRoute(builder: (context) {
                    //     return const ResetPasswordScreen();
                    //   }));
                    // }, // end onSubmit
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't get a code?",
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resent code',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
