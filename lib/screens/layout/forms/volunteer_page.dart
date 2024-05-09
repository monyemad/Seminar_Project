import 'package:final_project/screens/layout/forms/child_volunteer_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/form_field/custom_button.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/select_and_radio/custom_radio.dart';
import 'package:flutter/material.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({Key? key}) : super(key: key);

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  String? gender;
  String? report;

  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController volunteeraddress = TextEditingController();
  TextEditingController national = TextEditingController();

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
                    const Text(
                      'Fill in the data',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Volunteer information",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Full Name:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter your full Name",
                        prefixIcon: Icons.person_rounded,
                        controller: fullname,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'full name must not be empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Phone number:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter your Phone number",
                        prefixIcon: Icons.phone_rounded,
                        controller: phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'phone number must not be empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Address:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter Your Address",
                        controller: volunteeraddress,
                        prefixIcon: Icons.home_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'address must not be empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.streetAddress),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'National number:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter your National number",
                        controller: national,
                        prefixIcon: Icons.numbers_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'national number must not be empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number),
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
                      height: 20,
                    ),
                    CustomRadio(
                      text: "Has an official report:",
                      title: "Yes",
                      value: 'Yes',
                      groupValue: report,
                      title1: "No",
                      value1: "No",
                      onChange: (value) {
                        setState(() {
                          report = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        text: 'Next',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ChildVolunteerScreen(
                                  fullname: fullname.text,
                                  phone: phone.text,
                                  volunteeraddress: volunteeraddress.text,
                                  national: national.text,
                                  gender: gender.toString(),
                                  report: report.toString(),
                                );
                              }),
                            );
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    )
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
