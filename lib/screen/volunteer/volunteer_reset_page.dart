import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screen/signin/password/success_page.dart';
import 'package:final_project/screen/volunteer/volunteer_success_page.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolunteerResetPasswordScreen extends StatefulWidget {
  final String email;

  const VolunteerResetPasswordScreen({super.key, required this.email});

  @override
  State<VolunteerResetPasswordScreen> createState() =>
      _RestPasswordScreenState();
}

class _RestPasswordScreenState extends State<VolunteerResetPasswordScreen> {
  bool sec = true;
  bool tek = true;

  var visable = const Icon(Icons.visibility_rounded);
  var visableoff = const Icon(Icons.visibility_off_rounded);

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
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 85),
                        child: Text(
                          "Please, enter a new\npassword below.",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const CustomText(text: 'New Password:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: "Enter your new password",
                        controller: password,
                        isObscureText: tek,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icons.lock_rounded,
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
                            return 'new password must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Confirm new Password:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: "Enter your confirm new password",
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
                            return 'confirm new password must not be empty';
                          } else if (value != password.text) {
                            return 'new password does not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is VolunteerResetErrorState) {
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
                          } else if (state is VolunteerResetDoneState) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const VolunteerSuccessScreen();
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
                                  await context.read<AppCubitA>().volunteerResetPwd(
                                        password: password.text,
                                        confirmpassword: confirmpassword.text,
                                        email: widget.email,
                                      );
                                }
                              },
                              child: state is VolunteerResetLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "Save",
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
