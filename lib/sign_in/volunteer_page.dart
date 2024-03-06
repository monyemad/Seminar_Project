import 'package:final_project/sign_in/register_page.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_gender.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  TextEditingController address = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController childname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController seen = TextEditingController();
  TextEditingController national = TextEditingController();
  TextEditingController age = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffCDFFD8), Color(0xff94B9FF)],
                stops: [0.2, 0.6],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Fill in the data",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
                const CustomText(text: 'First_Name:'),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    hintText: "Enter your First_Name",
                    controller: firstname,
                    keyboardType: TextInputType.name),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(text: 'Last_Name:'),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    hintText: "Enter your Last_Name",
                    controller: lastname,
                    keyboardType: TextInputType.name),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(text: 'Phone Number:'),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    hintText: "Enter your phone number",
                    controller: phone,
                    keyboardType: TextInputType.phone),
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
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(text: 'Picture:'),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.install_mobile_rounded,
                          size: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Import image',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white70,
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(text: 'Child Name:'),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    hintText: "Enter your Child Name",
                    controller: childname,
                    keyboardType: TextInputType.name),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(text: 'Last Seen:'),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    hintText: "Enter your last seen",
                    controller: seen,
                    keyboardType: TextInputType.streetAddress),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(text: 'Child Age:'),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    hintText: "Enter your child age",
                    controller: age,
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                const CustomGender(),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "Submit",
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      }));
                    }),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
