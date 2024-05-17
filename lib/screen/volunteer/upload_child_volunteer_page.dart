import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadFoundScreen extends StatefulWidget {
  const UploadFoundScreen({super.key});

  @override
  State<UploadFoundScreen> createState() => _UploadFoundScreenState();
}

class _UploadFoundScreenState extends State<UploadFoundScreen> {
  ImagePicker picker = ImagePicker();
  File? img;

  Future<void> pickFromGallery() async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;
      setState(() {
        img = File(returnedImage.path);
        foundUploadImage(File(returnedImage.path));
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
        foundUploadImage(File(returnedImage.path));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> foundUploadImage(File image) async {
    try {
      Dio dio = Dio();
      if (img != null) {
        String imagename = img!.path.split("/").last;
        FormData formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(img!.path, filename: imagename),
        });
        print(img);
        print(imagename);

        final response = await dio.post(
            'https://sa3edny-backend-nodejs.onrender.com/found/uploadimage',
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
      body: Stack(
        children: [
          CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                            style: BorderStyle.solid, color: Colors.black26),
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
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                foundUploadImage(File("image"));
              },
              child: Text('Upload image'))
        ],
      ),
    );
  }
}
