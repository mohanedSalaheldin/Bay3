import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';

class RegisterResponseModel {
  bool status;
  String message;
  UserDataModel? userData;

  RegisterResponseModel(
      {required this.status, required this.message, this.userData});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'],
      message: json['message'],
      userData: json['data'] != null ? UserDataModel.fromJson(json['data']) : null,
    );
  }
}
