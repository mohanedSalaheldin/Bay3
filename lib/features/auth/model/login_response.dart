import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';

class LoginResponseModel {
  bool status;
  String message;
  UserDataModel? userData;

  LoginResponseModel(
      {required this.status, required this.message, this.userData});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'],
      message: json['message'],
      userData: json['data'] != null ? UserDataModel.fromJson(json['data']) : null,
    );
  }
}
