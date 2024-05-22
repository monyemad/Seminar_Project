import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class RecognitionScreen extends StatefulWidget {
  const RecognitionScreen({super.key});

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  ImagePicker picker = ImagePicker();
  File? img;
  String? responseData;

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
          'imagefile':
              await MultipartFile.fromFile(img!.path, filename: imagename),
        });
        print(img);
        print(imagename);

        final response = await dio.post(
            'https://66tx354g-5000.euw.devtunnels.ms/match-face',
            data: formData);

        if (response.statusCode == 200) {
          setState(() {
            responseData = response.data.toString();
          });
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomPop(
                    bottom: 40,
                  ),
                  const Image(
                    image: AssetImage("assets/images/matching image.png"),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      'Please import the photo to predict if the image is matched.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
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
                                upload(File("imagefile"));
                              },
                              child: const Text("Upload")),
                        ],
                      )
                    ],
                  ),
                  if (responseData != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        responseData!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
