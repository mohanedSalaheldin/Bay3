import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/features/auth/model/register_response.dart';
import 'package:e_commerce/features/auth/repository/auth_services.dart';
import 'package:flutter/material.dart';

enum RegisterStates {
  notRequested,
  loading,
  error,
  success,
}

class RegisterViewModel with ChangeNotifier {
  final AuthServices _services = AuthServicesImpl();
  RegisterStates _registerState = RegisterStates.notRequested;

  bool _passwordShown = true;
  bool get passwordShown => _passwordShown;

  void changePasswordVisiblity() {
    _passwordShown = !_passwordShown;
    notifyListeners();
  }

  bool _rePasswordShown = true;
  bool get rePasswordShown => _rePasswordShown;

  void changeRePasswordVisiblity() {
    _rePasswordShown = !_rePasswordShown;
    notifyListeners();
  }

  RegisterStates get registerStates => _registerState;

  void setRegisterState(RegisterStates newStete) {
    _registerState = newStete;
    notifyListeners();
  }

  // bool _isLoading = false;
  RegisterResponseModel? _registerResult;

  RegisterResponseModel get userRegisterResult =>
      _registerResult ?? RegisterResponseModel(status: true, message: '');

  void setRegisterResult(RegisterResponseModel response) {
    _registerResult = response;
  }

  void register({
    required String userEmail,
    required String userName,
    required String password,
    required String phone,
    required String image,
  }) async {
    // print('******************(RegisterViewModel)*****************');
    setRegisterState(RegisterStates.loading);
    // print('******************(RegisterViewModel)*****************');

    Either<Failure, RegisterResponseModel> reponse = await _services.register(
      userEmail: userEmail,
      userName: userName,
      password: password,
      phone: phone,
      image: image,
    );

    reponse.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setRegisterResult(RegisterResponseModel(
              status: false, message: OFFLINE_ERROR_MESSAGE));
        } else {
          setRegisterResult(RegisterResponseModel(
              status: false, message: SERVER_ERROR_MESSAGE));
        }

        setRegisterState(RegisterStates.error);
      },
      (model) {
        // print(model.status);
        setRegisterResult(RegisterResponseModel(
            status: model.status, message: model.message));
        if (model.status == true) {
          setRegisterState(RegisterStates.success);
        } else {
          setRegisterState(RegisterStates.error);
        }
      },
    );
  }
}
