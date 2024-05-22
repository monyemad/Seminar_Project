import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
  File? img1;
  String? imageId;

  Future<void> pickFromGallery() async {
    try {
      final returnedImage = await picker.pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;
      setState(() {
        img = File(returnedImage.path);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> pickFromCamera() async {
    try {
      final returnedImage = await picker.pickImage(source: ImageSource.camera);
      if (returnedImage == null) return;
      setState(() {
        img = File(returnedImage.path);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> upload(File image) async {
    try {
      if (img == null) {
        _showError('No image selected');
        return;
      }

      Dio dio = Dio();
      String imageName = img!.path.split('/').last;
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(img!.path, filename: imageName),
        'gender': gender.text,
      });

      final response = await dio.post(
        'https://c32a-41-33-18-118.ngrok-free.app/upload_image',
        data: formData,
      );

      if (response.statusCode == 200) {
        imageId = response.data['image_id'];
        _showSuccess('Image uploaded successfully. Image ID: $imageId');
        // Save imageId locally
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/image_id.txt');
        await file.writeAsString(imageId!);
      } else {
        _showError('Error uploading image: ${response.statusCode}');
      }
    } catch (e) {
      _showError('Error: $e');
    }
  }

  Future<void> result() async {
    try {
      if (imageId == null) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/image_id.txt');
        if (await file.exists()) {
          imageId = await file.readAsString();
        } else {
          _showError('No image ID found. Please upload an image first.');
          return;
        }
      }

      final response = await http.get(
        Uri.parse('https://c32a-41-33-18-118.ngrok-free.app/get_image/$imageId'),
      );

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final imageFile = File('${directory.path}/result.mp4');
        await imageFile.writeAsBytes(response.bodyBytes);

        setState(() {
          img1 = imageFile;
        });

        _showSuccess('Download started');
      } else {
        _showError('Retrieve failed: ${response.body}');
      }
    } catch (e) {
      _showError('Error: $e');
      print("$e");
    }
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
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
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Text(
                        'Please import the photo to predict the shape in five years.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Gender must not be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
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
                                  if (formkey.currentState!.validate()) {
                                    upload(File("image"));
                                  }
                                },
                                child: const Text("Upload")),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Center(
                          child: img1 == null
                              ? const Text('After 10 years')
                              : Image.file(
                            img1!,
                            width: 180,
                            height: 180,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              result();
                            },
                            child: const Text("Result")),
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
