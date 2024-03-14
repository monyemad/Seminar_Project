import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screens/layout/home_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';

// import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_gender.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ProductTypeEnum { Female, Male }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ProductTypeEnum? _productTypeEnum;

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
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'name must not be empty';
                          }
                          return null;
                        },
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
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'username must not be empty';
                          }
                          return null;
                        },
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
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
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
                          }
                          return null;
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
                            return 'confirm password must not be empty';
                          } else if (value.length < 6) {
                            return 'confirm password must be 6 numbers or letters';
                          }
                          // else {
                          //   return 'confirm password does not match';
                          // }
                        },
                      ),
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
                            return 'age must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // const CustomGender(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'Gender :',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 25, right: 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white30),
                                    child: RadioListTile<ProductTypeEnum>(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      title: Text(ProductTypeEnum.Female.name),
                                      value: ProductTypeEnum.Female,
                                      groupValue: _productTypeEnum,
                                      onChanged: (value) {
                                        setState(() {
                                          _productTypeEnum = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white30),
                                    child: RadioListTile<ProductTypeEnum>(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      title: Text(ProductTypeEnum.Male.name),
                                      value: ProductTypeEnum.Male,
                                      groupValue: _productTypeEnum,
                                      onChanged: (value) {
                                        setState(() {
                                          _productTypeEnum = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is CreateErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.error,
                                ),
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
                            width: 250,
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
                                        gender: _productTypeEnum.toString(),
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
