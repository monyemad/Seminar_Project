class UserData {
  String name;
  String email;
  String phone;
  String image;
  String age;
  String gender;

  UserData({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.gender,
    required this.age,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      age: json['age'],
      gender: json['gender'],
    );
  }
}
