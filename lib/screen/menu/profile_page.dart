import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/widgets/custom_profile_textfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();

  Future<String?> getVariable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  late String _imageUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchProfileImage();
  }

  Future<void> _fetchProfileImage() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://sa3edny-backend-nodejs.onrender.com/user/updateUser/$userId'),
      );
      if (response.statusCode == 200) {
        setState(() {
          _imageUrl = response.body;
        });
      } else {
        print(
            'Failed to fetch profile image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching profile image: $e');
    }
  }

  String? userId;

  // Future<void> getDataFromFirebase(
  //   String name,
  //   String email,
  //   String phone,
  //   String gender,
  //   String age,
  //   String image,
  // ) async {
  //   try {
  //     Map<String, dynamic> request = {
  //       'name': name,
  //       "email": email,
  //       "phone": phone,
  //       'image': image,
  //       'gender': gender,
  //       'age': age,
  //     };
  //     var response = await http.put(
  //         Uri.parse(
  //             'https://sa3edny-backend-nodejs.onrender.com/user/updateUser/$userId'),
  //         body: convert.jsonEncode(request),
  //         headers: {"Content-type": "application/json"});
  //     if (response.statusCode == 200) {
  //       print('Response: ${response.body}');
  //     } else {
  //       print("Failed to load: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomPop(
                      bottom: 40,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: _imageUrl.isNotEmpty
                              ? const NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIraIxLFndsHnK34RQm1q525ZHz77CFY2vCw&usqp=CAU")
                              : NetworkImage(_imageUrl),
                          backgroundColor: Colors.white70,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 4,
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
                                icon: const Icon(Icons.camera_alt_rounded)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                        label: 'User Name:',
                        text: name.text,
                        onChanged: (name) {}),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFieldWidget(
                        label: 'Email:',
                        text: email.text,
                        onChanged: (email) {}),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFieldWidget(
                        label: 'Phone:',
                        text: phone.text,
                        onChanged: (phone) {}),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFieldWidget(
                        label: 'Age:', text: age.text, onChanged: (age) {}),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFieldWidget(
                        label: 'Gender:',
                        text: gender.text,
                        onChanged: (gender) {}),
                    const SizedBox(
                      height: 25,
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
