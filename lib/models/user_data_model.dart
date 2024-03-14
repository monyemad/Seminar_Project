class UserDataModel {
  String name;
  String email;
  String phone;
  String image;

  UserDataModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
    );
  }
}