import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screen/layout/home_page.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:final_project/widgets/select_and_radio/custom_radio.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? gender;

  bool sec = true;
  bool tek = true;

  var visable = const Icon(Icons.visibility_rounded);
  var visableoff = const Icon(Icons.visibility_off_rounded);

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController confirmpassword = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'@');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            Form(
              key: formkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomPop(
                        bottom: 25,
                      ),
                      const CustomText(text: 'Name:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your name',
                        controller: name,
                        prefixIcon: Icons.account_circle_rounded,
                        keyboardType: TextInputType.name,
                        validate: (name) => name!.length < 4
                            ? 'Name should be at least 4 characters'
                            : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Username:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your username',
                        controller: username,
                        prefixIcon: Icons.account_circle_rounded,
                        keyboardType: TextInputType.name,
                        validate: (username) => username!.length < 8
                            ? 'Name should be at least 8 characters'
                            : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Email:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your email address',
                        controller: email,
                        prefixIcon: Icons.email_rounded,
                        keyboardType: TextInputType.emailAddress,
                        validate: validateEmail,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Password:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: "Enter your password",
                        controller: password,
                        isObscureText: tek,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icons.lock_rounded,
                        // prefixIcon: const Icon(Icons.key_rounded),
                        suffixIcon: IconButton(
                          icon: tek ? visableoff : visable,
                          onPressed: () {
                            setState(() {
                              tek = !tek;
                            });
                          },
                        ),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'password must not be empty';
                          } else if (RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
                              .hasMatch(value)) {
                            return null;
                          }
                          return 'Please enter a password';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Confirm password:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          hintText: "Enter your confirm password",
                          controller: confirmpassword,
                          isObscureText: sec,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock_rounded,
                          // prefixIcon: const Icon(Icons.key_rounded),
                          suffixIcon: IconButton(
                            icon: sec ? visableoff : visable,
                            onPressed: () {
                              setState(() {
                                sec = !sec;
                              });
                            },
                          ),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password must not be empty';
                            } else if (value != password.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Phone:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your phone',
                        controller: phone,
                        prefixIcon: Icons.phone_rounded,
                        keyboardType: TextInputType.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'phone must not be empty';
                          } else if (phone.text.length != 10) {
                            return 'Please Enter a valid number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Age:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your age',
                        controller: age,
                        prefixIcon: Icons.numbers,
                        keyboardType: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Age must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadio(
                        text: "Gender:",
                        title: "Female",
                        value: 'Female',
                        groupValue: gender,
                        title1: "Male",
                        value1: "Male",
                        onChange: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is CreateErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: CustomSnackBarError(
                                  message: state.error,
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                          } else if (state is CreateDoneState) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }));
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            width: 220,
                            child: MaterialButton(
                              elevation: 12,
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: const Color(0xff0C359E),
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  await context.read<AppCubitA>().registerUser(
                                        email: email.text,
                                        password: password.text,
                                        confirmpassword: confirmpassword.text,
                                        name: name.text,
                                        username: username.text,
                                        age: age.text,
                                        gender: gender.toString(),
                                        phone: phone.text,
                                      );
                                }
                              },
                              child: state is CreateLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "Register",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
