import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/models/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubitA extends Cubit<AppStateA> {
  AppCubitA() : super(MyAppInitial());

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

  Future<void> login(
      String email,
      String password,
      ) async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          emit(LoginDoneState());
        }
      });
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> register(
      {required String email,
        required String password,
        // required String name,
        required String phone}) async {
    try {
      emit(CreateLoadingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          saveUserData(
            email: email,
            password: password,
            // name: name,
            uid: value.user!.uid,
            phone: phone,
          ).then((value) {
            if (value) {
              emit(CreateDoneState());
            } else{
              emit(CreateErrorState('saveUserData Error'));
            }
          });
        }
      });
    } catch (e) {
      emit(CreateErrorState(e.toString()));
    }
  }

  Future<bool> saveUserData(
      {required String email,
        required String password,
        // required String name,
        required String uid,
        required String phone}) async {
    try {
      FirebaseFirestore.instance.collection("users").doc(uid).set({
        'email': email,
        'password': password,
        // 'name': name,
        'phone': phone,
        'uid': uid,
        'image': '',
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

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
    } catch (e) {e.toString();}
  }
}
