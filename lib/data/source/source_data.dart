import 'package:final_project/data/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataSource {
  static bool isLoadingProfile = true;

  static Future<String?> getVariable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  static ProfileModel? userData;

  static Future<ProfileModel?> profileData() async {
    try {
      String? userId = await getVariable();
      print('Retrieved userId: $userId'); // Debug print
      if (userId == null) {
        print("UserId is null");
        return null;
      }
      final response = await http.get(
        Uri.parse(
            'https://sa3edny-backend-nodejs.onrender.com/User/getUseById/$userId'),
      );
      if (response.statusCode == 200) {
        var user = jsonDecode(response.body);
        print(user);
        if (user != null) {
          userData = ProfileModel.fromJson(user);
          userData = ProfileModel(
            username: user['username'],
            password: user['password'],
            name: user['name'],
            age: user['age'],
            gender: user['gender'],
            email: user['email'],
            phoneNumber: user['phoneNumber'],
          );
        }
        print("get profile data successfully");
      } else {
        print('Failed to fetch user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}