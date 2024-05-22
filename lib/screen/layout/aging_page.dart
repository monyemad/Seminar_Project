import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class EvolutionScreen extends StatefulWidget {
  const EvolutionScreen({super.key});

  @override
  State<EvolutionScreen> createState() => _EvolutionScreenState();
}

class _EvolutionScreenState extends State<EvolutionScreen> {
  TextEditingController gender = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ImagePicker picker = ImagePicker();
  File? img;

  Future<void> pickFromGallery() async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;
      setState(() {
        img = File(returnedImage.path);
        upload(File(returnedImage.path));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> pickFromCamera() async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnedImage == null) return;
      setState(() {
        img = File(returnedImage.path);
        upload(File(returnedImage.path));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> upload(File image) async {
    try {
      Dio dio = Dio();
      if (img != null) {
        String imagename = img!.path.split("/").last;
        FormData formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(img!.path, filename: imagename),
          'gender': gender.text,
        });
        print(img);
        print(imagename);

        final response = await dio.post(
            'https://assuring-fun-ocelot.ngrok-free.app/upload_image',
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
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomPop(
                      bottom: 40,
                    ),
                    const Image(
                      image: AssetImage("assets/images/aging image.png"),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Text(
                        'Please import the photo to predict the shape in five years.',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const CustomText(
                      text: 'Gender',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        hintText: "Enter your child gender",
                        controller: gender,
                        prefixIcon: Icons.transgender_rounded,
                        keyboardType: TextInputType.text,
                      validate: (value){
                          if(value!.isEmpty){
                            return "Gender must not be empty";
                          }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: pickFromGallery,
                                child: const Text("Gallery")),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: pickFromCamera,
                                child: const Text("Camera")),
                          ],
                        ),
                        Column(
                          children: [
                            Center(
                              child: img == null
                                  ? const Text('Image not selected')
                                  : Image.file(
                                      img!,
                                      width: 180,
                                      height: 180,
                                    ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if(formkey.currentState!.validate()){
                                    upload(File("image"));
                                  }
                                },
                                child: const Text("Upload")),
                          ],
                        )
                      ],
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
