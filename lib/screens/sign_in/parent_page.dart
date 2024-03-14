import 'package:final_project/screens/sign_in/child_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_gender.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  TextEditingController address = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController relation = TextEditingController();
  TextEditingController national = TextEditingController();
  TextEditingController record = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            SingleChildScrollView(
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
                  const CustomText(text: 'First_Name:'),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      hintText: "Enter your First_Name",
                      controller: firstname,
                      prefixIcon: Icons.person,
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
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name),
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
                      prefixIcon: Icons.house_rounded,
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
                      prefixIcon: Icons.confirmation_number_rounded,
                      keyboardType: TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text: 'National ID:'),
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
                            Icons.add_a_photo_rounded,
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
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
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
                      keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomGender(),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text: 'Record Number:'),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      hintText: "Enter your Record number",
                      controller: record,
                      prefixIcon: Icons.numbers_rounded,
                      keyboardType: TextInputType.number),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                      text: "Next",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ChildScreen();
                        }));
                      }),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
