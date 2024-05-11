// import 'package:final_project/widgets/custom_profile.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
// import 'package:final_project/widgets/custom_pop.dart';
// import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:final_project/controllers/user_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController userController = Get.put(UserController());

  TextEditingController name = TextEditingController();
  // TextEditingController userId = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  // TextEditingController gender = TextEditingController();

  // String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: userController.username,
                    decoration: const InputDecoration(hintText: 'username'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: userController.name,
                    decoration: const InputDecoration(hintText: 'name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: userController.phoneNumber,
                    decoration: const InputDecoration(hintText: 'phone'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: userController.email,
                    decoration: const InputDecoration(hintText: 'email'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: userController.gender,
                    decoration: const InputDecoration(hintText: 'gender'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: userController.password,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: userController.age,
                    decoration: const InputDecoration(hintText: 'age'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userController.fetchUserData();
                    },
                    child: const Text('get data'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
