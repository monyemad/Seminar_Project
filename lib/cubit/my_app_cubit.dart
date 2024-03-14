import 'dart:convert';
import 'dart:io';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/models/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubitA extends Cubit<AppStateA> {
  AppCubitA() : super(MyAppInitial());

  Future<void> registerUser(
      {required String email,
      required String password,
      required String confirmpassword,
      required String name,
      required String username,
      required String age,
      required String gender,
      required String phone}) async {
    try {
      emit(CreateLoadingState());
      Map<String, String> userData = {
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "confirmpassword": confirmpassword.toString(),
        "phoneNumber": phone,
        "age": age,
        "gender": gender.toString(),
      };
      var response = await http.post(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/user/registerUser'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 201) {
        emit(CreateDoneState("user registered successfully"));
      } else {
        emit(CreateFailState(
            "Failed to register user.Status code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(CreateErrorState(e.toString()));
    }
  }

  String _responseData = '';

  Future<void> loginData() async {
    try {
      emit(LoginLoadingState());
      final response = await http.get(Uri.parse(
          'https://sa3edny-backend-nodejs.onrender.com/user/userLogin'));
      if (response.statusCode == 201) {
        Map<String, dynamic> userLogin = json.decode(response.body);
        emit(LoginDoneState('${_responseData = userLogin['key']}'));
      } else {
        emit(LoginDoneState("Failed to register user.Status code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  UserDataModel? userData;

  Future<void> getDataFromFirebase() async {
    try {
      emit(GetDataLoadingState());
      String? uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userA =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      userData = UserDataModel(
        name: userA['name'],
        email: userA['email'],
        phone: userA['phone'],
        image: userA['image'],
      );
      emit(GetDataDoneState());
    } catch (e) {
      emit(GetDataErrorState(e.toString()));
    }
  }

  // Future<void> login(
  //     String email,
  //     String password,
  //     ) async {
  //   try {
  //     emit(LoginLoadingState());
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     )
  //         .then((value) {
  //       if (value.user != null) {
  //         emit(LoginDoneState());
  //       }
  //     });
  //   } catch (e) {
  //     emit(LoginErrorState(e.toString()));
  //   }
  // }

  ImagePicker picker = ImagePicker();
  File? img;

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      img = File(image.path);
      uploadImageToUserData(File(image.path));
      emit(PickImageState());
    } else {
      print("null img");
    }
  }

  Future<void> uploadImageToUserData(File image) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      final ref = FirebaseStorage.instance
          .ref()
          .child('usersImages')
          .child('${DateTime.now()}.jpg');

      await ref.putFile(File(image.path));
      String? url;
      url = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(uid).update(
        {
          'image': url,
        },
      );
    } catch (e) {
      e.toString();
    }
  }
}
