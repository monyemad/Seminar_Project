import 'dart:io';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:final_project/data/model/profile_model.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class AppCubitA extends Cubit<AppStateA> {
  AppCubitA() : super(MyAppInitial());

  String? userId;

  Future<void> saveVariable(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<String?> getVariable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
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
        emit(CreateDoneState("User Registered Successfully"));
      } else {
        print("Failed to register user.Status code: ${response.statusCode}");
        emit(CreateErrorState(
            "Check Your Data"));
      }
    } catch (e) {
      print("Error: $e");
      emit(CreateErrorState("Registration Failed"));
    }
  }

  Future<void> volunteerRegisterUser(
      {required String email,
      required String password,
      required String confirmpassword,
      required String name,
      required String username,
      required String age,
      required String gender,
      required String phone}) async {
    try {
      emit(VolunteerCreateLoadingState());
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
              'https://sa3edny-backend-nodejs.onrender.com/volunteer/registerUser'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 201) {
        emit(VolunteerCreateDoneState("User Registered Successfully"));
      } else {
        print("Failed to register user.Status code: ${response.statusCode}");
        emit(VolunteerCreateErrorState(
            "Check your Data"));
      }
    } catch (e) {
      print("Error: $e");
      emit(VolunteerCreateErrorState('Registration Failed'));
    }
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
        emit(LoginDoneState(userId ?? '', 'User Login Successfully'));
      } else {
        print("Failed to login user. Status code: ${response.statusCode}");
        emit(LoginErrorState(
            "Incorrect email or password"));
      }
    } catch (e) {
      print("Error: $e");
      emit(LoginErrorState("User Login Failed"));
    }
  }

  Future<void> logInVolunteer({
    required String password,
    required String email,
  }) async {
    try {
      emit(VolunteerLoginLoadingState());
      Map<String, dynamic> userLogin = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(
            'https://sa3edny-backend-nodejs.onrender.com/volunteer/userLogin'),
        body: jsonEncode(userLogin),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final userId = responseData['userId'];
        await saveVariable(userId);
        print('user is login successfully: ${response.body}');
        emit(VolunteerLoginDoneState(
            userId ?? '', 'User Login Successfully'));
      } else {
        print("Failed to login user. Status code: ${response.statusCode}");
        emit(VolunteerLoginErrorState(
            "Incorrect Email or Password"));
      }
    } catch (e) {
      print("Error: $e");
      emit(LoginErrorState("User Login Failed"));
    }
  }

  Future<void> resetPwd({
    required String email,
    required String password,
    required String confirmpassword,
  }) async {
    try {
      emit(ResetLoadingState());
      Map<String, dynamic> userData = {
        'email': email,
        'password': password,
        'confirmpassword': confirmpassword,
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
      print('Error: ${e}');
      emit(ResetErrorState('Error: ${e}'));
    }
  }

  Future<void> volunteerResetPwd({
    required String email,
    required String password,
    required String confirmpassword,
  }) async {
    try {
      emit(VolunteerResetLoadingState());
      Map<String, dynamic> userData = {
        'email': email,
        'password': password,
        'confirmpassword': confirmpassword,
      };
      final response = await http.put(
        Uri.parse(
            'https://sa3edny-backend-nodejs.onrender.com/volunteer/resetUserPassword'),
        body: jsonEncode(userData),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print('user is rest successfully: ${response.body}');
        emit(VolunteerResetDoneState());
      } else {
        print("Failed to reset user. Status code: ${response.statusCode}");
        emit(VolunteerResetErrorState(
            "Failed to reset user. Status code: ${response.statusCode}"));
      }
    } catch (e) {
      print('Error: ${e}');
      emit(VolunteerResetErrorState('Error: ${e}'));
    }
  }

  ProfileModel? userData;

  Future<void> profileData(String userId) async {
    try {
      emit(ProfileLoadingState());
      String? userId = await getVariable();
      print('Retrieved userId: $userId'); // Debug print
      if (userId == null) {
        emit(ProfileErrorState("UserId is null"));
        return;
      }
      // List User=[];
      final response = await http.get(
        Uri.parse(
            'https://sa3edny-backend-nodejs.onrender.com/User/getUseById/${userId}'),
      );
      var responsebody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('$responsebody');
        // User.addAll(responsebody);
        // print(User);
        var user = jsonDecode(responsebody);
        print(user);
        if (user != null) {
          // userData = ProfileModel.fromJson(user);
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
        emit(ProfileDoneState("get profile data successfully"));
      } else {
        emit(ProfileErrorState('Failed to fetch user data'));
      }
    } catch (e) {
      emit(ProfileErrorState('Error fetching user data: $e'));
    }
  }

  // Future<void> profileData(String username) async {
  //   try {
  //     emit(ProfileLoadingState());
  //     String? userId = await getVariable();
  //     print('Retrieved userId: $userId'); // Debug print
  //     if (userId == null) {
  //       emit(ProfileErrorState("UserId is null"));
  //       return;
  //     }
  //     final response = await http.get(Uri.parse(
  //         'https://sa3edny-backend-nodejs.onrender.com/user/updateUser/$userId'));
  //     if (response.statusCode == 200) {
  //       print('user is rest successfully: ${response.body}');
  //       emit(ProfileDoneState());
  //     } else {
  //       print("Failed to reset user. Status code: ${response.statusCode}");
  //       emit(ProfileErrorState(
  //           "Failed to reset user. Status code: ${response.statusCode}"));
  //     }
  //   } catch (e) {
  //     emit(ProfileErrorState(e.toString()));
  //   }
  // }

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
    required String image,
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
        "imageUrl": image,
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
      };
      var response = await http.post(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/found/createCase/$userId'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 500) {
        print("Failed to created.Status code: ${response.statusCode}");
        emit(FoundCaseErrorState(
            "Failed to created.Status code: ${response.statusCode}"));
      } else {
        print('success: ${response.body}');
        emit(FoundCaseDoneState("volunteer created successfully"));
      }
    } catch (e) {
      print('Error: ${e}');
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
    required String image,
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
        "imageUrl": image,
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
      };
      var response = await http.post(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/missing/createCase/$userId'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 500) {
        print("Failed to created.Status code: ${response.statusCode}");
        emit(MissingCaseErrorState(
            "Failed to created.Status code: ${response.statusCode}"));
      } else {
        print('missing created successfully: ${response.statusCode}');
        emit(MissingCaseDoneState("missing created successfully"));
      }
    } catch (e) {
      print('Error: $e');
      emit(MissingCaseErrorState(e.toString()));
    }
  }

  Future<void> therapySession({
    required String name,
    required String age,
    required String gender,
    required String contactNumber,
    required String email,
    required String date,
    required String appointment,
    required String where,
    required String subjectDetails,
    required String status,
    required String feedback,
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
        "name": name,
        "age": age,
        "gender": gender,
        "contactNumber": contactNumber,
        "email": email,
        "date": date,
        "appointment": appointment,
        "where": where,
        "subjectDetails": subjectDetails,
        "status": status,
        "feedback": feedback,
      };
      final response = await http.post(
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/theropySession/createReq/$userId'),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
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
      await foundUploadImage(File(image.path));
    } else {
      print("null img");
    }
  }

  Future<void> foundUploadImage(File image) async {
    try {
      if (img != null) {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://sa3edny-backend-nodejs.onrender.com/found/uploadimage'),
        );

        // List<int> bytes = await img!.readAsBytes();
        // var image = http.MultipartFile.fromBytes('image', img!.path);
        // request.files.add(image);

        var response = await request.send();

        if (response.statusCode == 200) {
          print('Image uploaded successfully');
        } else {
          print('Error uploading image: ${response.reasonPhrase}');
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> dnaData({
    required String name,
    required String gender,
    required String age,
    required String address,
    required String type,
    required String email,
    required String phone,
    required String lab,
    required String branch,
    required String appointment,
  }) async {
    try {
      emit(DnaLabLoadingState());
      Map<String, String> userData = {
        'patient_name': name,
        'patient_gender': gender,
        'patient_age': age,
        'patient_address': address,
        'patient_type': type,
        'contact_email': email,
        'contact_phone_number': phone,
        'lab': lab,
        'lab_branch': branch,
        'appointment': appointment,
      };
      final response = await http.post(
          Uri.parse(
              "https://sa3edny-backend-nodejs.onrender.com/reservation/createReservation"),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
        emit(DnaLabDoneState("dna lab created successfully"));
      } else {
        emit(DnaLabErrorState(
            "Failed to created.Status code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(DnaLabErrorState(e.toString()));
    }
  }

  Future<void> supportData({
    required String complain,
  }) async {
    try {
      emit(SupportLoadingState());
      String? userId = await getVariable();
      print('Retrieved userId: $userId'); // Debug print
      if (userId == null) {
        emit(TherapySessionErrorState("UserId is null"));
        return;
      }
      Map<String, String> userData = {
        "name": "",
        "contactNumber": "",
        "email": "",
        "date": "",
        "complaintDetails": complain,
        "status": "",
        "feedback": ''
      };
      final response = await http.post(
          Uri.parse(
              "https://sa3edny-backend-nodejs.onrender.com/support/createReq/$userId"),
          body: convert.jsonEncode(userData),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
        emit(SupportDoneState("Support created successfully"));
      } else {
        emit(SupportErrorState(
            "Failed to created.Status code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(SupportErrorState(e.toString()));
    }
  }

  Future<void> matching()async{
    try{
      emit(DnaResultLoadingState());
      final response = await http.get(
          Uri.parse(
              "https://jokerboyxx0.pythonanywhere.com/calculate_and_display_matching_score"));
      if (response.statusCode == 200) {
        emit(DnaResultDoneState("Dna Matching Found"));
      }
      else {
        print("Failed to match.Status code: ${response.statusCode}");
        // emit(DnaResultErrorState(
        //     "Failed to Match"));
      }
    }catch(e){
      print('Error:$e');
      // emit(DnaResultErrorState(e.toString()));
    }
  }
}
