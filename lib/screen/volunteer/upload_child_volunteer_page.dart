import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
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
        // matchFace(returnedImage.path);
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
        // matchFace(returnedImage.path);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> matchFace(File imageFile) async {
    final url = 'https://gfbb003j-5000.euw.devtunnels.ms/match-face';
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('photo-path', imageFile.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var result = jsonDecode(responseBody);
        print('Match result: $result');
      } else {
        print('Failed to match face. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Stack(
        children: [
          const CustomBgColor(),
          Column(
            children: [
              ElevatedButton(onPressed: pickFromGallery, child: const Text("Gallery")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: pickFromCamera, child: const Text("Camera")),
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
                height: 10,
              ),
              ElevatedButton(onPressed: img == null
                  ? null
                  : () {
                matchFace(img!);
              }, child: const Text("Upload")),
            ],
          ),
        ],
      ),
    );
  }
}