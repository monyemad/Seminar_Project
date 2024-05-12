import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/controllers/user_controller.dart';
import 'package:final_project/screen/layout/home_page.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  UserController userController = Get.put(UserController());

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomPop(
                      bottom: 70,
                    ),
                    CustomTextFormField(
                      hintText: 'Name',
                      controller: name,
                      keyboardType: TextInputType.name,
                      prefixIcon: Icons.person_rounded,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'value must not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'UserName',
                      controller: username,
                      keyboardType: TextInputType.name,
                      prefixIcon: Icons.person_rounded,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'value must not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_rounded,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'value must not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Phone number',
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_rounded,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'value must not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Gender',
                      controller: gender,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.face,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'value must not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock_rounded,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'value must not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Age',
                      controller: age,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.numbers_rounded,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'value must not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userController.updateUserData();
                        if (formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'Success',
                                message: "user is updated successfully",
                                contentType: ContentType.success,
                                // color: const Color(0xffC40C0C),
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          );
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: CustomSnackBarError(
                                message: "user must enter all the data first",
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          );
                        }
                      },
                      child: const Text('update data'),
                    ),
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
