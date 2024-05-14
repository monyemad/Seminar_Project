import 'package:final_project/screen/volunteer/volunteer_home_page.dart';
import 'package:final_project/widgets/form_field/custom_button.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';

class VolunteerSuccessScreen extends StatelessWidget {
  const VolunteerSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/success.png"),
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "New password\n confirmed successful",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        // color: Colors.white
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'You have successfully confirm your new\n password. Please, use your new password\n when logging in.',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomButton(
                        text: "Okay",
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const VolunteerHomeScreen(username: '', email: '',);
                              }));
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
