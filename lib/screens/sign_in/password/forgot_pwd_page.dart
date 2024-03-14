import 'package:final_project/screens/sign_in/password/verification_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();

  // @override
  // void dispose() {
  //   email.dispose();
  //   super.dispose();
  // }
  //
  // Future passwordReset() async {
  //   try{
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(email: email.text.trim());
  //   } on FirebaseAuthException catch(e){
  //     // print(e);
  //     showDialog(context: context, builder: (context){
  //       return AlertDialog(
  //         content: Text(e.message.toString()),
  //       );
  //     });
  //   }
  //   // return null;
  // }

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
                  const CustomPop(bottom: 0,),
                  const Image(
                    image: AssetImage('assets/images/forgot.png'),
                    height: 350,
                    width: 350,
                  ),
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please,enter your email address below\n to receive your user and a new password',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const CustomText(text: 'Email:'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      hintText: 'example@gmail.com',
                      controller: email,
                      prefixIcon: Icons.email_rounded,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: 'Reset password',
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const VerificationScreen();
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
