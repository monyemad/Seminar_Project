import 'package:final_project/login_page.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
            // transform: GradientRotation(13)
          ),
        ),
        child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Log out',
                  style: TextStyle(fontSize: 25),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text(
                                "Are you sure?",
                                style: TextStyle(fontSize: 25),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const LoginScreen();
                                      }));
                                    },
                                    child: const Text('YES')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const SettingScreen();
                                      }));
                                    },
                                    child: const Text('NO')),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.logout_rounded)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
