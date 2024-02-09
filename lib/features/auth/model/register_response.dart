class RegisterResponseModel {
  bool status;
  String message;
  UserData? userData;

  RegisterResponseModel(
      {required this.status, required this.message, this.userData});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'],
      message: json['message'],
      userData: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String token;

  UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
    );
  }
}
