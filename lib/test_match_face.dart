// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
//
// class FaceMatchApp extends StatefulWidget {
//   const FaceMatchApp({super.key});
//
//   @override
//   _FaceMatchAppState createState() => _FaceMatchAppState();
// }
//
// class _FaceMatchAppState extends State<FaceMatchApp> {
//   File? _image;
//
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> _uploadImage() async {
//     if (_image == null) return;
//
//     final url = Uri.parse('https://gfbb003j-5000.euw.devtunnels.ms//match-face');
//
//     final request = http.MultipartRequest('POST', url)
//       ..fields['photo-path'] = _image!.path
//       ..files.add(await http.MultipartFile.fromPath('photo-path', _image!.path));
//
//     final response = await request.send();
//
//     if (response.statusCode == 200) {
//       final responseBody = await response.stream.bytesToString();
//       final responseJson = jsonDecode(responseBody);
//       print('Success: $responseJson');
//     } else {
//       print('Failed to upload image: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Face Match'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? const Text('No image selected.')
//                 : Image.file(_image!),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.camera),
//               child: const Text('Pick Image from Camera'),
//             ),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.gallery),
//               child: const Text('Pick Image from Gallery'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: const Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
