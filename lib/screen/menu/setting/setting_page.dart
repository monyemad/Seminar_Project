import 'package:final_project/screen/menu/setting/edit_account_page.dart';
import 'package:final_project/screen/signin/login_page.dart';
import 'package:final_project/widgets/dialog/custom_setting_dialog.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomPop(bottom: 40,),
              const Image(image: AssetImage('assets/images/setting.gif'),
                height: 300,
                width: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Edit Account',
                    style: TextStyle(fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const EditAccountScreen();
                            }));
                      },
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
                  Navigator.pop(context, MaterialPageRoute(builder: (context) {
                    return const SettingScreen();
                  }));
                },
                name: 'Log out',
                label: 'Are you sure?',
                text1: "YES",
                text2: "NO",
                icon: Icons.logout_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
