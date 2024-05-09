import 'dart:io';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:final_project/cubit/my_app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class AppCubitA extends Cubit<AppStateA> {
  AppCubitA() : super(MyAppInitial());

  Future<void> getDataFromFirebase(
    String name,
    String email,
    String phone,
    String gender,
    String age,
    String image,
  ) async {
    try {
      emit(GetDataLoadingState());
      Map<String, dynamic> request = {
        'name': name,
        "email": email,
        "phone": phone,
        'image': image,
        'gender': gender,
        'age': age,
      };
      var response = await http.put(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/user/updateUser/$userId'),
          body: convert.jsonEncode(request),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        emit(GetDataDoneState());
      } else {
        emit(GetDataErrorState("Failed to load: ${response.statusCode}"));
      }
      emit(GetDataDoneState());
    } catch (e) {
      emit(GetDataErrorState(e.toString()));
    }
  }

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
        "confirmpassword": confirmpassword,
        "phoneNumber": phone,
        "age": age,
        "gender": gender,
      };
      var response = await http.post(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/user/registerUser'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 201) {
        emit(CreateDoneState("user registered successfully"));
      } else {
        print("Failed to register user.Status code: ${response.statusCode}");
        emit(CreateErrorState(
            "Failed to register user.Status code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(CreateErrorState(e.toString()));
    }
  }

  String? userId;

  Future<void> saveVariable(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<void> logIn({
    required String password,
    required String email,
  }) async {
    try {
      emit(LoginLoadingState());
      Map<String, dynamic> userLogin = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse('https://sa3edny-backend-nodejs.onrender.com/user/userLogin'),
        body: jsonEncode(userLogin),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final userId = responseData['userId'];
        await saveVariable(userId);
        print('user is login successfully: ${response.body}');
        emit(LoginDoneState(userId ?? '', 'user is login successfully'));
      } else {
        emit(LoginErrorState(
            "Failed to login user. Status code: ${response.statusCode}"));
      }
    } catch (e) {
      print("Error: $e");
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> resetPwd({
    required String email,
    required String username,
    required String password,
    required String confirmpassword,
  }) async {
    try {
      emit(ResetLoadingState());
      Map<String, dynamic> userData = {
        'username': username,
        'email': email,
        'password': password,
        'confirmPassword': confirmpassword,
      };
      final response = await http.put(
        Uri.parse(
            'https://sa3edny-backend-nodejs.onrender.com/user/resetUserPassword'),
        body: jsonEncode(userData),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print('user is rest successfully: ${response.body}');
        emit(ResetDoneState());
      } else {
        print("Failed to reset user. Status code: ${response.statusCode}");
        emit(ResetErrorState(
            "Failed to reset user. Status code: ${response.statusCode}"));
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      emit(ResetErrorState(e.toString()));
    }
  }

  Future<String?> getVariable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<void> foundCase({
    required String age,
    required String childname,
    required String phone,
    required String address,
    required String currentaddress,
    required String volunteeraddress,
    required String fullname,
    required String childgender,
    required String healthstate,
    required String way,
    required String governorate,
    required String currentgovernment,
    required String currentcity,
    required String city,
    required String clothes,
    required String mark,
    required String report,
    required String gender,
    required String national,
    required String dna,
    required String childDna,
    required String result,
  }) async {
    try {
      emit(FoundCaseLoadingState());
      String? userId = await getVariable();
      print('Retrieved userId: $userId'); // Debug print
      if (userId == null) {
        emit(FoundCaseErrorState("UserId is null"));
        return;
      }
      Map<String, String> userData = {
        "child_name": childname,
        "child_age": age,
        "child_gender": childgender,
        "child_health_state": healthstate,
        "way_of_found": way,
        "child_clothes": clothes,
        "child_mark": mark,
        "governorate_of_found": governorate,
        "city_of_found": city,
        "address_of_found": address,
        "current_government": currentgovernment,
        "current_city": currentcity,
        "current_address": currentaddress,
        "volunteer_fullname": fullname,
        "volunteer_phone_number": phone,
        "volunteer_address": volunteeraddress,
        "volunteer_national_id": national,
        "volunteer_gender": gender,
        "has_official_report": report,
        "parentDna-id": dna,
        "childDna-id": childDna,
        "results": result,
      };
      var response = await http.post(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/found/createCase/$userId'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
        print('success: ${response.body}');
        emit(FoundCaseDoneState("volunteer created successfully"));
      } else {
        print("Failed to created.Status code: ${response.statusCode}");
        emit(FoundCaseErrorState(
            "Failed to created.Status code: ${response.statusCode}"));
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      emit(FoundCaseErrorState(e.toString()));
    }
  }

  Future<void> missingCase({
    required String national,
    required String relation,
    required String record,
    required String childgender,
    required String lost,
    required String address,
    required String childaddress,
    required String phone,
    required String healthstate,
    required String clothes,
    required String city,
    required String state,
    required String absence,
    required String fullname,
    required String certificate,
    required String age,
    required String childname,
    required String mark,
    required String government,
    required String gender,
    required String dna,
    required String childDna,
    required String result,
  }) async {
    try {
      emit(MissingCaseLoadingState());
      String? userId = await getVariable();
      print('Retrieved userId: $userId'); // Debug print
      if (userId == null) {
        emit(MissingCaseErrorState("UserId is null"));
        return;
      }
      Map<String, String> userData = {
        "child_name": childname,
        "child_age": age,
        "child_gender": childgender,
        "child_health_state": healthstate,
        "child_address": childaddress,
        "lost_before": lost,
        "child_clothes": clothes,
        "child_mark": mark,
        "child_governorate": government,
        "child_city": city,
        "state_of_missing": state,
        "birth_certificate": certificate,
        "date_of_absence": absence,
        "reporter_full_name": fullname,
        "reporter_phoneNumber": phone,
        "reporterAddress": address,
        "reporter_national_id": national,
        "reporter_relative_relation": relation,
        "reporter_gender": gender,
        "record_number": record,
        "parentDna-id": dna,
        "childDna-id": childDna,
        "results": result,
      };
      var response = await http.post(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/missing/createCase/$userId'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 201) {
        print('missing created successfully: ${response.statusCode}');
        emit(MissingCaseDoneState("missing created successfully"));
      } else {
        print("Failed to created.Status code: ${response.statusCode}");
        emit(MissingCaseErrorState(
            "Failed to created.Status code: ${response.statusCode}"));
      }
    } catch (e) {
      print('Error: $e');
      emit(MissingCaseErrorState(e.toString()));
    }
  }

  Future<void> therapySession({
    required String fullname,
    required String email,
    required String phone,
    required String date,
  }) async {
    try {
      emit(TherapySessionLoadingState());
      String? userId = await getVariable();
      print('Retrieved userId: $userId'); // Debug print
      if (userId == null) {
        emit(TherapySessionErrorState("UserId is null"));
        return;
      }
      Map<String, String> userData = {
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "date": date,
      };
      var response = await http.post(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/theropySession/createReq/$userId'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 201) {
        emit(TherapySessionDoneState("child created successfully"));
      } else {
        emit(TherapySessionErrorState(
            "Failed to created.Status code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(TherapySessionErrorState(e.toString()));
    }
  }

  ImagePicker picker = ImagePicker();
  File? img;

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      img = File(image.path);
      foundUploadImage(File(image.path));
      emit(PickImageState());
    } else {
      print("null img");
    }
  }

  // Future<void> _fetchProfileImage() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(
  //           'https://sa3edny-backend-nodejs.onrender.com/user/updateUser/$userId'),
  //     );
  //     if (response.statusCode == 200) {
  //       // setState(() {
  //       //   _imageUrl = response.body;
  //       // });
  //     } else {
  //       print(
  //           'Failed to fetch profile image. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching profile image: $e');
  //   }
  // }

  Future<void> foundUploadImage(File image) async {
    try {
      emit(UploadLoadingState());
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      final response = await http.put(
        Uri.parse(
            'https://sa3edny-backend-nodejs.onrender.com/found/uploadimage'),
        body: {
          'image': base64Image,
        },
      );
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        emit(UploadDoneState());
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        emit(UploadErrorState(
            'Failed to upload image. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      print('Error uploading image: $e');
      emit(UploadErrorState('Error uploading image: $e'));
    }
  }

  Future<void> dnaData() async{
    try{}catch(e){}
  }
}
