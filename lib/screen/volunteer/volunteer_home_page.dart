import 'dart:io';

import 'package:final_project/screen/menu/policies_page.dart';
import 'package:final_project/screen/volunteer/volunteer_form_page.dart';
import 'package:http/http.dart' as http;

import 'package:final_project/screen/layout/dna/dna_page.dart';
import 'package:final_project/screen/layout/forms/parent_form_page.dart';
import 'package:final_project/screen/menu/complain.dart';
import 'package:final_project/screen/menu/setting/setting_page.dart';
import 'package:final_project/screen/volunteer/volunteer_support_page.dart';
import 'package:final_project/widgets/home/custom_home(ltr).dart';
import 'package:final_project/widgets/home/custom_home(rtl).dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VolunteerHomeScreen extends StatefulWidget {
  final String username;
  final String email;

  const VolunteerHomeScreen(
      {super.key, required this.username, required this.email});

  @override
  State<VolunteerHomeScreen> createState() => _VolunteerHomeScreenState();
}

class _VolunteerHomeScreenState extends State<VolunteerHomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  ImagePicker picker = ImagePicker();
  File? img;

  Future<void> pickFromGallery() async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;
      setState(() {
        img = File(returnedImage.path);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // File? _imageFile;
  //
  // Future<void> uploadImage() async {
  //   if (_imageFile != null) {
  //     var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse('http://your-server-url.com/upload'),
  //     );
  //
  //     var image = await http.MultipartFile.fromPath('image', _imageFile!.path);
  //     request.files.add(image);
  //
  //     var response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       // Image uploaded successfully
  //       print('Image uploaded successfully');
  //     } else {
  //       // Error uploading image
  //       print('Error uploading image: ${response.reasonPhrase}');
  //     }
  //   }
  // }

  File? imageFile;

  Future<void> foundUploadImage() async {
    if (imageFile != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://your-server-url.com/upload'),
      );

      var image = await http.MultipartFile.fromPath('image', imageFile!.path);
      request.files.add(image);

      var response = await request.send();

      if (response.statusCode == 200) {
        // Image uploaded successfully
        print('Image uploaded successfully');
      } else {
        // Error uploading image
        print('Error uploading image: ${response.reasonPhrase}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.username),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile 2.jpg',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg image.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('share'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.file_copy),
              title: const Text('Policies'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PolicyScreen();
                }));
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.person),
            //   title: const Text('Profile'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return const ProfileScreen();
            //     }));
            //   },
            // ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingScreen();
                }));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.report_rounded),
              title: const Text('Complain'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ComplainScreen();
                }));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            _globalKey.currentState?.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu_rounded,
                            color: Colors.grey,
                            size: 30,
                          )),
                      const Text(
                        'Sa3dni',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_rounded,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomHome2(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: const Text(
                                  "Report as....",
                                  style: TextStyle(fontSize: 20),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const VolunteerScreen();
                                        }));
                                      },
                                      child: const Text("FOUND")),
                                ],
                              );
                            });
                      },
                      image: "assets/images/form.gif",
                      text: "Form"),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomHome(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const DnaScreen();
                        }));
                      },
                      image: "assets/images/dna-image.gif",
                      text: 'Laboratory\nReservation'),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomHome2(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const VolunteerSupportScreen();
                        }));
                      },
                      image: "assets/images/help 2.gif",
                      text: 'Help Center'),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
