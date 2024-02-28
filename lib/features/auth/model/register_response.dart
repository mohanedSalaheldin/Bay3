
class RegisterResponseModel {
  bool status;
  String message;

  RegisterResponseModel(
      {required this.status, required this.message});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
