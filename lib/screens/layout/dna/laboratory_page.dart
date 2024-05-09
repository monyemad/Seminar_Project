import 'package:final_project/screens/menu/complain.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/select_and_radio/custom_radio.dart';
import 'package:final_project/widgets/select_and_radio/custom_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaboratoryScreen extends StatefulWidget {
  const LaboratoryScreen({super.key});

  @override
  State<LaboratoryScreen> createState() => _LaboratoryScreenState();
}

class _LaboratoryScreenState extends State<LaboratoryScreen> {
  var selectedItem;
  var lab;
  String? gender;
  String? type;

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController address = TextEditingController();
  TextEditingController age = TextEditingController();

  TextEditingController date = TextEditingController();
  DateTime dateTime = DateTime(3000, 2, 1, 10, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const CustomBgColor(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SafeArea(
                      child: Text(
                        "Laboratory Reservation Form",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
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
                      hintText: 'Enter your full name',
                      controller: firstname,
                      prefixIcon: Icons.person_rounded,
                      keyboardType: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Full name must not be empty';
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
                    const CustomText(text: 'Age:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: 'Enter your age',
                      controller: age,
                      prefixIcon: Icons.perm_contact_calendar_rounded,
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
                    const CustomText(text: 'Address:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: 'Enter your street address',
                      controller: address,
                      prefixIcon: Icons.house_rounded,
                      keyboardType: TextInputType.streetAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'street address must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomRadio(
                      text: "Type:",
                      title: "Parent",
                      value: 'Parent',
                      groupValue: type,
                      title1: "Child",
                      value1: "Child",
                      onChange: (value) {
                        setState(() {
                          type = value;
                        });
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
                      hintText: 'Enter your email',
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
                    const CustomText(text: 'Phone Number:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: 'Enter your phone number',
                      controller: phone,
                      prefixIcon: Icons.phone_rounded,
                      keyboardType: TextInputType.number,
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
                    const CustomText(text: 'Laboratory'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSelect(
                        onChanged: (val) {
                          setState(() {
                            lab = val;
                          });
                        },
                        items: const ['Alfa', 'ElMokhtabar'],
                        text: 'Select a lab',
                        value: lab),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Location:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSelect(
                        onChanged: (val) {
                          setState(() {
                            selectedItem = val;
                          });
                        },
                        items: const [
                          'New Cairo',
                          'El Nozha',
                          'Second New Cairo',
                          'Badr City',
                          '10th of Ramadan City',
                          'Heliopolis'
                        ],
                        text: 'Choose a Place',
                        value: selectedItem),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      Text(
                        'Date',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          dateTime.toIso8601String(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                          height: 26,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                minimumSize: const Size(250, 440)),
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Done",
                                          ),
                                        ),
                                        Expanded(
                                          child: CupertinoDatePicker(
                                            initialDateTime: dateTime,
                                            mode: CupertinoDatePickerMode
                                                .dateAndTime,
                                            onDateTimeChanged: (date) {
                                              setState(() {
                                                dateTime = date;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text('press:'),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 220,
                        child: MaterialButton(
                          elevation: 12,
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: const Color(0xff0C359E),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ComplainScreen();
                            }));
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ]),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
