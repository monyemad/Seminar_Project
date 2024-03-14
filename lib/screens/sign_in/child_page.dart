import 'package:final_project/screens/guest/home_guest.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_gender.dart';
import 'package:final_project/widgets/custom_text.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class ChildScreen extends StatefulWidget {
  const ChildScreen({super.key});

  @override
  State<ChildScreen> createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  var selectedItem;

  TextEditingController picture = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController current = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController government = TextEditingController();

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
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Child information",
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
                    Stack(
                      children: [
                        Image(image: AssetImage('assets/images/child (2).png'),width: 150,),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              border:
                              Border.all(style: BorderStyle.solid, color: Colors.black26),
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  // context.read<AppCubitA>().pickImage();
                                },
                                icon: Icon(Icons.camera_alt)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const CustomText(text: 'Child Name:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your Child Name",
                      controller: name,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    const CustomText(text: 'Birth certificate:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your Child Birth certificate",
                      controller: birth,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomGender(),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Age:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your Child age",
                      controller: age,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Current Age:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your Child current age",
                      controller: current,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Government:'),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white30,
                        // border: Border.all(style: BorderStyle.solid, color: Colors.black12),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: DropdownButton(
                        underline: const Divider(endIndent: 4,indent: 4,),
                        isExpanded: true,
                        hint: const Text(
                          'Select a Country',
                          style: TextStyle(
                            // fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                        items: ['Cairo', 'Giza', 'Aswan', 'Alexandria', 'Luxor']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedItem = val;
                          });
                        },
                        value: selectedItem,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      },
                      text: 'Submit',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
