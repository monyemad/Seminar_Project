import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screen/guest/home_guest_page.dart';
import 'package:final_project/screen/signin/register_page.dart';
import 'package:final_project/screen/volunteer/volunteer_forgot_page.dart';
import 'package:final_project/screen/volunteer/volunteer_home_page.dart';
import 'package:final_project/screen/layout/home_page.dart';
import 'package:final_project/screen/signin/password/forget_password_page.dart';
import 'package:final_project/screen/volunteer/volunteer_register_page.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:final_project/widgets/form_field/custom_button.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool sec = true;

  var visable = const Icon(Icons.visibility_rounded);
  var visableoff = const Icon(Icons.visibility_off_rounded);

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

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
      body: Stack(
        children: [
          const CustomBgColor(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const CustomText(text: "Email:"),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomLogin(
                        hintText: "Enter your email",
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_rounded,
                        validate: validateEmail,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomText(text: "Password:"),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomLogin(
                        hintText: "Enter your password",
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icons.lock_rounded,
                        suffixIcon: IconButton(
                          icon: sec ? visableoff : visable,
                          onPressed: () {
                            setState(() {
                              sec = !sec;
                            });
                          },
                        ),
                        isObscureText: sec,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'password must not be empty';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text(
                                          "Forget Password as....",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                          return const ForgotPasswordScreen();
                                                        }));
                                              },
                                              child: const Text("Parent")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                          return const VolunteerForgotPasswordScreen();
                                                        }));
                                              },
                                              child: const Text("VOLUNTEER")),
                                        ],
                                      );
                                    });
                              },
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is LoginErrorState) {
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
                          } else if (state is LoginDoneState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: AwesomeSnackbarContent(
                                  title: 'Success',
                                  message: state.message,
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
                                  return HomeScreen(
                                    username: username.text, email: email.text,
                                  );
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
                                  await context.read<AppCubitA>().logIn(
                                      password: password.text,
                                      email: email.text);
                                }
                              },
                              child: state is LoginLoadingState
                                  ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                                  : const Text(
                                "Parent",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is VolunteerLoginErrorState) {
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
                          } else if (state is VolunteerLoginDoneState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: AwesomeSnackbarContent(
                                  title: 'Success',
                                  message: state.message,
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
                                  return VolunteerHomeScreen(
                                    username:username.text,
                                    email:email.text,
                                  );
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
                                  await context.read<AppCubitA>().logInVolunteer(
                                      password: password.text,
                                      email: email.text);
                                }
                              },
                              child: state is VolunteerLoginLoadingState
                                  ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                                  : const Text(
                                "Volunteer",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15,),
                      CustomButton(text: 'Guest', onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return const HomeGuestScreen();
                            }));
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: const Text(
                                        "Create as....",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                        return const RegisterScreen();
                                                      }));
                                            },
                                            child: const Text("PARENT")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                        return const VolunteerRegisterScreen();
                                                      }));
                                            },
                                            child: const Text("VOLUNTEER")),
                                      ],
                                    );
                                  });
                            },
                            child: const Text(
                              'Register Now',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
