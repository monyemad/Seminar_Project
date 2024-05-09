import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screens/menu/support_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/snakbar/custom_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TherapyScreen extends StatefulWidget {
  const TherapyScreen({
    super.key,
  });

  @override
  State<TherapyScreen> createState() => _TherapyScreenState();
}

class _TherapyScreenState extends State<TherapyScreen> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();
  TextEditingController booking = TextEditingController();

  TextEditingController type = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController date = TextEditingController();
  DateTime dateTime = DateTime(3000, 2, 1, 10, 20);

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomPop(bottom: 25),
                    const Center(
                      child: Text(
                        'Therapy Booking',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: const Text(
                        'Welcome to your therapy session this is a safe space for you '
                            'to explore your thoughts-feelings and experiences here at '
                            'sa3edni therapy '
                            'Your therapist is here to support you on your journey towards growth and healing'
                            ' Take a moment to center yourself and book your sessions here.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black26),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Fullname:',),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: fullname,
                        hintText: 'Enter your fullName',
                        prefixIcon: Icons.account_box_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'fullname must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: 'Email:'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        hintText: 'Enter Your Email',
                        prefixIcon: Icons.email_outlined,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: 'Phone number'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phone,
                        hintText: '(+20) 0000000000',
                        prefixIcon: Icons.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter phone Number';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: 'Date:'),
                    const SizedBox(height: 10,),
                    CustomTextFormField(
                      hintText: 'Select your Date',
                        controller: date,
                        keyboardType: TextInputType.datetime,
                      prefixIcon: Icons.date_range_rounded,
                    ),
                    // Container(
                    //   alignment: Alignment.centerLeft,
                    //   padding: const EdgeInsets.only(
                    //     left: 40,
                    //   ),
                    //   child: CupertinoButton(
                    //       onPressed: () {
                    //         showCupertinoModalPopup(
                    //             context: context,
                    //             builder: (BuildContext context) => SizedBox(
                    //                   height: 190,
                    //                   child: CupertinoDatePicker(
                    //                     backgroundColor: Colors.white,
                    //                     initialDateTime: dateTime,
                    //                     onDateTimeChanged: (DateTime newTime) {
                    //                       setState(() => dateTime = newTime);
                    //                     },
                    //                     use24hFormat: true,
                    //                   ),
                    //                 ));
                    //       },
                    //       child: const Text(
                    //         'Select Date:YY/MM/DD',
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.black),
                    //       )),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 220,
                      child: BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is TherapySessionErrorState) {
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
                          } else if (state is TherapySessionDoneState) {
                            Navigator.pop(context,
                                MaterialPageRoute(builder: (context) {
                                  return const SupportScreen();
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
                                  await context
                                      .read<AppCubitA>()
                                      .therapySession(
                                      fullname: fullname.text,
                                      email: email.text,
                                      phone: phone.text,
                                      date: date.text);
                                }
                              },
                              child: state is TherapySessionLoadingState
                                  ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                                  : const Text(
                                "Submit",
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
                    ),
                    const SizedBox(
                      height: 10,
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
