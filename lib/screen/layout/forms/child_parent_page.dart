import 'dart:io';

import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screen/layout/home_page.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:final_project/widgets/select_and_radio/custom_select.dart';
import 'package:final_project/widgets/select_and_radio/custom_radio.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChildScreen extends StatefulWidget {
  final String fullname;
  final String address;
  final String phone;
  final String national;
  final String record;
  final String relation;
  final String gender;

  const ChildScreen(
      {super.key,
      required this.fullname,
      required this.address,
      required this.phone,
      required this.national,
      required this.record,
      required this.relation,
      required this.gender});

  @override
  State<ChildScreen> createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  String? selectedItem;
  String? childgender;
  String? healthstate;
  String? government;
  String? city;
  String? statemissing;
  String? lost;

  TextEditingController childaddress = TextEditingController();
  TextEditingController clothes = TextEditingController();
  TextEditingController mark = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController dna = TextEditingController();
  TextEditingController childDna = TextEditingController();
  TextEditingController result = TextEditingController();
  TextEditingController absence = TextEditingController();
  TextEditingController childname = TextEditingController();
  TextEditingController age = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ImagePicker picker = ImagePicker();
  File? img;

  Future<void> pickFromGallery() async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) {
        await missingUploadImage(File(returnedImage!.path));
      }
      setState(() {
        img = File(returnedImage.path);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> missingUploadImage(File image) async {
    try {
      Dio dio = Dio();
      if (img != null) {
        String imagename = img!.path.split("/").last;
        FormData formData = FormData.fromMap({
          'image':
              await MultipartFile.fromFile(img!.path, filename: imagename),
        });
        print(img);
        print(imagename);

        final response = await dio.post(
            'https://sa3edny-backend-nodejs.onrender.com/missing/uploadimage',
            data: formData);

        if (response.statusCode == 200) {
          print('Image uploaded successfully: ${response.data}');
        } else {
          print('Error uploading image: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
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
                          img == null
                              ? Image.asset(
                                  'assets/images/child (2).png',
                                  height: 150,
                                  width: 150,
                                )
                              : Image.file(
                                  img!,
                                  width: 150,
                                  height: 150,
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
                                  onPressed: pickFromGallery,
                                  icon: const Icon(Icons.camera_alt)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Child Image:",style: TextStyle(fontSize: 20),),
                          const SizedBox(width: 10,),
                          ElevatedButton(
                              onPressed: () {
                                missingUploadImage(File("image"));
                              },
                              child: const Text("Upload image")),
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
                        controller: childname,
                        keyboardType: TextInputType.name,
                        prefixIcon: Icons.person_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'child name must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Child Age:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: "Enter your Child age",
                        controller: age,
                        prefixIcon: Icons.numbers_rounded,
                        keyboardType: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'child age must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadio(
                        text: "Child Gender:",
                        title: "Female",
                        value: "Female",
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
                          items: const [
                            'Healthy',
                            'Disabled',
                            'Chronically ill'
                          ],
                          text: 'Choose Child Health State',
                          value: healthstate),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Child Address:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: "Enter your Child address",
                        controller: childaddress,
                        prefixIcon: Icons.house_rounded,
                        keyboardType: TextInputType.streetAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'child address must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadio(
                        text: "Lost before?",
                        title: "Yes",
                        value: 'Yes',
                        groupValue: lost,
                        title1: "No",
                        value1: "No",
                        onChange: (value) {
                          setState(() {
                            lost = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Child Clothes:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          hintText: "Enter your child clothes",
                          controller: clothes,
                          prefixIcon: Icons.face_rounded,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'child clothes must not be empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Child Birthmark:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          hintText: "Enter your child birthmark",
                          controller: mark,
                          prefixIcon: Icons.bookmark_rounded,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'child birthmark must not be empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text),
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
                            selectedItem = val;
                          });
                        },
                        items: const [
                          'Cairo',
                          'Giza',
                          'Aswan',
                          'Alexandria',
                          'Gharbiya',
                          'Port Said',
                          'Suez',
                          'Damietta',
                          'Dakahlia',
                          'Al Qalyubia',
                          'Kafr El-Sheikh',
                          'Al Sharqia',
                          'Beheria',
                          'Ismailia',
                          'Beni Suef',
                          'Minya',
                          'Sohag',
                          'Qena',
                          'New valley',
                          'Matrouh',
                          'North Sinai',
                          'South Sinai',
                        ],
                        text: 'Select a Country',
                        value: selectedItem,
                      ),
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
                          'Cairo',
                          'Central Alexandria',
                          'El Mahalla El Kubra',
                          'Zefta',
                          'Borg Al Arab',
                          'Al Agamy',
                          '6 October city',
                          'Al Doqi',
                          'Al Ayyat',
                          'South Al Ayyat',
                          'Pyramid city',
                          'Heliopolis',
                          'Nozha',
                          'New Cairo',
                          'Ain Shams',
                          'Shorouk',
                          'Badr',
                          'Maadi',
                          'Tanta',
                          'Zeitoun',
                          'Port Said',
                          'Suez',
                          'Faysal',
                          'Damietta',
                          'Kafr Saad',
                          'Kafr El Battikh',
                          'Mansoura',
                          'Nasr City',
                          'Matareyah',
                          'Belbes',
                          '10th of Ramadan',
                          'Banha City',
                          'Al Obour city',
                          'Shubra',
                          'Qaha',
                          'Kafr EL Sheikh',
                          'Ismailia',
                          'Aswan',
                          'Qena',
                          'Sohag',
                          'Minya',
                          'Beni Suef',
                          'Damanhour',
                          'Hurghada',
                          'Marsa Alam',
                          'Marsa Matruh',
                          'Sharm El Sheikh',
                          'Dahab',
                          'Nuweibaa',
                          'Al Arish',
                          'Dakhla city',
                          'Kharga city',
                          'Ras Sedr',
                          'Ras Ghareb',
                          'Safaga city',
                        ],
                        text: 'Select a City',
                        value: city,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'what happened to the child?'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomSelect(
                          onChanged: (val) {
                            setState(() {
                              statemissing = val;
                            });
                          },
                          items: const [
                            'Lost',
                            'Runaway',
                            'Kidnapped',
                            'Do not Know',
                          ],
                          text: 'state of missing',
                          value: statemissing),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Birth certificate:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: "Enter your Child Birth certificate",
                        controller: date,
                        keyboardType: TextInputType.number,
                        prefixIcon: Icons.numbers_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'birth certificate must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Child date of absence:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: "Enter your Child date of absence",
                        controller: absence,
                        keyboardType: TextInputType.datetime,
                        prefixIcon: Icons.date_range_rounded,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'child date of absence must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is MissingCaseErrorState) {
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
                          } else if (state is MissingCaseDoneState) {
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
                              return const HomeScreen(
                                username: '',
                                email: '',
                              );
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
                                  await context.read<AppCubitA>().missingCase(
                                        age: age.text,
                                        childname: childname.text,
                                        government: selectedItem.toString(),
                                        national: widget.national,
                                        relation: widget.relation,
                                        record: widget.record,
                                        address: widget.address,
                                        phone: widget.phone,
                                        childaddress: childaddress.text,
                                        healthstate: healthstate.toString(),
                                        gender: widget.gender.toString(),
                                        childgender: childgender.toString(),
                                        lost: lost.toString(),
                                        clothes: clothes.text,
                                        city: city.toString(),
                                        state: statemissing.toString(),
                                        absence: absence.text,
                                        fullname: widget.fullname,
                                        certificate: date.text,
                                        mark: mark.text,
                                        image: img!.path,
                                      );
                                }
                              },
                              child: state is MissingCaseLoadingState
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
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
