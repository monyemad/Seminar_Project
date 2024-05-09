import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screens/layout/home_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/select_and_radio/custom_radio.dart';
import 'package:final_project/widgets/select_and_radio/custom_select.dart';
import 'package:final_project/widgets/snakbar/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildVolunteerScreen extends StatefulWidget {
  final String fullname;
  final String phone;
  final String volunteeraddress;
  final String national;
  final String? gender;
  final String? report;

  const ChildVolunteerScreen(
      {Key? key,
      required this.fullname,
      required this.phone,
      required this.volunteeraddress,
      required this.national,
      this.gender,
      this.report})
      : super(key: key);

  @override
  State<ChildVolunteerScreen> createState() => _ChildVolunteerScreenState();
}

class _ChildVolunteerScreenState extends State<ChildVolunteerScreen> {
  String? childgender;
  String? healthstate;
  String? way;
  String? governorate;
  String? city;
  String? currentgovernment;
  String? currentcity;

  TextEditingController childname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController clothes = TextEditingController();
  TextEditingController mark = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController currentaddress = TextEditingController();

  TextEditingController dna = TextEditingController();
  TextEditingController childdna = TextEditingController();
  TextEditingController result = TextEditingController();

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
                      "Fill in the data",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
                        const Image(
                          image: AssetImage('assets/images/child (2).png'),
                          width: 150,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black26),
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  // context.read<AppCubitA>().pickImage();
                                },
                                icon: const Icon(Icons.camera_alt)),
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
                        hintText: "Enter Child Name",
                        prefixIcon: Icons.person_rounded,
                        controller: childname,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'child name must not be empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Child Age:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter child age",
                        controller: age,
                        prefixIcon: Icons.numbers_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'child age must not be empty';
                          } else if (value.length != 2) {
                            return 'child age must have to digit';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomRadio(
                      text: "Child Gender:",
                      title: "Female",
                      value: 'Female',
                      groupValue: childgender,
                      title1: "Male",
                      value1: "Male",
                      onChange: (value) {
                        setState(() {
                          childgender = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Child Health State:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSelect(
                        onChanged: (val) {
                          setState(() {
                            healthstate = val;
                          });
                        },
                        items: const ['Healthy', 'Disabled', 'Chronically ill'],
                        text: 'Choose Child Health State',
                        value: healthstate),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'what did you do with the child?'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSelect(
                        onChanged: (val) {
                          setState(() {
                            way = val;
                          });
                        },
                        items: const [
                          'Found and stayed with a known person',
                          'Found and handed over to the police',
                          'Child begs with an adult',
                          'Child begs alone',
                          'Lost child'
                        ],
                        text: 'way of found',
                        value: way),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Child clothes:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter child clothes",
                      controller: clothes,
                      prefixIcon: Icons.child_care_rounded,
                      keyboardType: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Clothes must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Is child having a birthmark?'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter child birthmark",
                      controller: mark,
                      prefixIcon: Icons.bookmark_border_rounded,
                      keyboardType: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Child birthmark must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Government:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSelect(
                        onChanged: (val) {
                          setState(() {
                            governorate = val;
                          });
                        },
                        items: const [
                          'Egypt',
                          'Madinaty',
                          '10th of Ramadan',
                          'New Cairo',
                          'Shorouk'
                        ],
                        text: 'choose a country',
                        value: governorate),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'City:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSelect(
                        onChanged: (val) {
                          setState(() {
                            city = val;
                          });
                        },
                        items: const [
                          'Rehab city',
                          'Shorouk city',
                          '6th of october city',
                          'Second New Cairo city',
                          'New Cairo city'
                        ],
                        text: 'Choose a city',
                        value: city),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Address:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter child Address",
                        controller: address,
                        prefixIcon: Icons.home_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'child address must not be empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.streetAddress),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Current Government:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSelect(
                        onChanged: (val) {
                          setState(() {
                            currentgovernment = val;
                          });
                        },
                        items: const [
                          'Egypt',
                          'Madinaty',
                          '10th of Ramadan',
                          'New Cairo',
                          'Shorouk'
                        ],
                        text: 'Choose a country',
                        value: currentgovernment),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Current City:'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomSelect(
                        onChanged: (val) {
                          setState(() {
                            currentcity = val;
                          });
                        },
                        items: const [
                          'Rehab city',
                          'Shorouk city',
                          '6th of october city',
                          'Second New Cairo city',
                          'New Cairo city'
                        ],
                        text: 'Choose a city',
                        value: currentcity),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: "Current Address:"),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter child current Address",
                        controller: currentaddress,
                        prefixIcon: Icons.home_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'current address must not be empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.streetAddress),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<AppCubitA, AppStateA>(
                      listener: (context, state) {
                        if (state is FoundCaseErrorState) {
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
                        } else if (state is FoundCaseDoneState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'Success',
                                message: state.done,
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
                            return const HomeScreen();
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
                                await context.read<AppCubitA>().foundCase(
                                      age: age.text,
                                      childname: childname.text,
                                      phone: widget.phone ?? '',
                                      address: address.text,
                                      gender: widget.gender.toString() ?? '',
                                      national: widget.national ?? '',
                                      currentaddress: currentaddress.text,
                                      volunteeraddress:
                                          widget.volunteeraddress ?? '',
                                      fullname: widget.fullname ?? '',
                                      childgender: childgender.toString(),
                                      healthstate: healthstate.toString(),
                                      way: way.toString(),
                                      governorate: governorate.toString(),
                                      currentgovernment:
                                          currentgovernment.toString(),
                                      currentcity: currentcity.toString(),
                                      city: city.toString(),
                                      clothes: clothes.text,
                                      mark: mark.text,
                                      report: widget.report.toString() ?? '',
                                      dna: dna.text ?? '',
                                      childDna: childdna.text ?? '',
                                      result: result.text ?? '',
                                    );
                              }
                            },
                            child: state is FoundCaseLoadingState
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
