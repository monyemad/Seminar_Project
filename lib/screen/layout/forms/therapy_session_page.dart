import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screen/menu/support_page.dart';
import 'package:final_project/widgets/custom_date.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
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

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController booking = TextEditingController();
  TextEditingController appointment = TextEditingController();
  TextEditingController feedback = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController where = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController status = TextEditingController();

  DateTime dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        dateTime = value!;
      });
    });
  }

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
                    const CustomText(
                      text: 'name:',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: name,
                        hintText: 'Enter your name',
                        prefixIcon: Icons.account_box_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'name must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      text: 'Age:',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.number,
                        controller: age,
                        hintText: 'Enter your age',
                        prefixIcon: Icons.numbers_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'age must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      text: 'Gender:',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.text,
                        controller: gender,
                        hintText: 'Enter your gender',
                        prefixIcon: Icons.transgender_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'gender must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: 'Contact number'),
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
                            return 'Enter your contact Number';
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
                    const CustomText(text: 'Date:'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDate(
                      hintText: '${dateTime.day},${dateTime.month},${dateTime.year}',
                      keyboardType: TextInputType.datetime,
                      // validate: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'appointment must not be empty';
                      //   }
                      //   return null;
                      // },
                      prefixIcon: IconButton(
                          onPressed: _showDatePicker,
                          icon: const Icon(Icons.date_range_rounded)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Appointment'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: appointment,
                        hintText: 'Enter you appointment',
                        prefixIcon: Icons.timelapse_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'appointment must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: 'Place:'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.text,
                        controller: where,
                        hintText: 'Enter where you are going',
                        prefixIcon: Icons.place_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'place must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: 'Subject:'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.text,
                        controller: subject,
                        hintText: 'Enter your subject',
                        prefixIcon: Icons.subject_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'subject must be not empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: 'Status:'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.text,
                        controller: status,
                        hintText: 'Enter your status',
                        // prefixIcon: Icons.status,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'status must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: 'Feedback'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.text,
                        controller: feedback,
                        hintText: 'enter your feedback here',
                        // prefixIcon: Icons.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'feedback must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<AppCubitA, AppStateA>(
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
                                        name: name.text,
                                        email: email.text,
                                        date: dateTime.toString(),
                                        age: age.text,
                                        gender: gender.text,
                                        contactNumber: phone.text,
                                        appointment: appointment.text,
                                        where: where.text,
                                        subjectDetails: subject.text,
                                        status: status.text,
                                        feedback: feedback.text);
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
