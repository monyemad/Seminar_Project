import 'package:final_project/screen/layout/forms/child_parent_page.dart';
import 'package:final_project/widgets/form_field/custom_button.dart';
import 'package:final_project/widgets/select_and_radio/custom_radio.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  String? gender;
  String? record;

  TextEditingController address = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController relation = TextEditingController();
  TextEditingController national = TextEditingController();

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
                    const Text(
                      "Fill in the data",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Parent information",
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
                      height: 10,
                    ),
                    const CustomText(text: 'Full Name:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter your Full Name",
                        controller: fullname,
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'fullname must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Phone Number:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter your phone Number",
                        controller: phone,
                        prefixIcon: Icons.phone_rounded,
                        keyboardType: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'phone number must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Address:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter your Address",
                        controller: address,
                        prefixIcon: Icons.house_rounded,
                        keyboardType: TextInputType.streetAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'address must not be empty';
                        }
                        return null;
                      },
                    ),
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
                        prefixIcon: Icons.confirmation_number_rounded,
                        keyboardType: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'national number must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Relative Relation:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter your Relative Relation",
                        controller: relation,
                        prefixIcon: Icons.people_alt_rounded,
                        keyboardType: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'relative relation must not be empty';
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
                      height: 20,
                    ),
                    CustomRadio(
                      text: "Has an official record?",
                      title: "Yes",
                      value: 'Yes',
                      groupValue: record,
                      title1: "No",
                      value1: "No",
                      onChange: (value) {
                        setState(() {
                          record = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                        text: 'Next',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ChildScreen(
                                fullname: fullname.text,
                                phone: phone.text,
                                address: address.text,
                                national: national.text,
                                record: record.toString(),
                                relation: relation.text,
                                gender: gender.toString(),
                              );
                            }));
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
