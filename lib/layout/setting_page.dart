import 'package:final_project/sign_in/login_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_setting_dialog.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Setting',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Edit Account',
                    style: TextStyle(fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_rounded)),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Language',
                    style: TextStyle(fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_rounded)),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              CustomSetting(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                  },
                  function: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) {
                          return const SettingScreen();
                        }));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
