class ProfileModel {
  ProfileModel({
    required this.username,
    required this.password,
    required this.name,
    required this.age,
    required this.gender,
    required this.email,
    required this.phoneNumber,
  });
  late final String username;
  late final String password;
  late final String name;
  late final String age;
  late final String? gender;
  late final String email;
  late final String phoneNumber;

  ProfileModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    password = json['password'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    _data['name'] = name;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    return _data;
  }
}