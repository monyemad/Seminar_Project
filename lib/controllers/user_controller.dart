import 'dart:convert';

import 'package:final_project/model/profile_model.dart';

// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  Future<String?> getVariable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  ProfileModel? userModel;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  // String? gender;

  fetchUserData() async {
    var token = 'YOUR_TOKEN';
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      String? userId = await getVariable();
      print('Retrieved userId: $userId');
      if (userId == null) {
        return;
      }
      http.Response response = await http.get(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/User/getUseById/$userId'),
          headers: headers);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        userModel = ProfileModel.fromJson(result);
        username.text = result["username"];
        password.text = result["password"];
        name.text = result["name"];
        age.text = result["age"];
        gender.text = result["gender"];
        email.text = result["email"];
        phoneNumber.text = result["phoneNumber"];
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('error $e');
    }
  }

  updateUserData() async {
    var token = 'YOUR_TOKEN';
    try {
      var body = {
        'username': username.text,
        'password': password.text,
        'name': name.text,
        'age': age.text,
        'gender': gender.text,
        'email': email.text,
        'phoneNumber': phoneNumber.text,
      };
      String? userId = await getVariable();
      print('Retrieved userId: $userId');
      if (userId == null) {
        return;
      }
      http.Response response = await http.put(
        Uri.parse(
            'https://sa3edny-backend-nodejs.onrender.com/user/updateUser/$userId'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print('data updated');
        print(json);
      } else {
        print('response status code not 200');
        throw jsonDecode(response.body)['meta']["message"] ??
            "Unknown Error Occurred";
      }
    } catch (e) {
      print(e);
    }
  }
}
