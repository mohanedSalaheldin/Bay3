import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/configs/cache_helper/cache_helper.dart';
import 'package:e_commerce/core/configs/network/helpers/api_response_states.dart';
import 'package:e_commerce/features/auth/model/login_response.dart';
import 'package:e_commerce/features/auth/repository/auth_services.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const String USER_TOKEN_KEY = 'token';

enum LoginStates {
  notRequested,
  loading,
  error,
  success,
}

class LoginViewModel extends ChangeNotifier {
  final AuthServices _services = AuthServicesImpl();
  final CacheHelper _cacheHelper = CacheHelperImpl();

  LoginStates _loginState = LoginStates.notRequested;
  bool _passwordShown = true;
  LoginResponseModel? _loginResult;

  bool get passwordShown => _passwordShown;
  LoginStates get loginState => _loginState;
  LoginResponseModel get userLoginResult =>
      _loginResult ?? LoginResponseModel(status: false, message: '');

  void changePasswordVisiblity() {
    _passwordShown = !_passwordShown;
    notifyListeners();
  }

  void setLoginState(LoginStates newStete) {
    _loginState = newStete;
    notifyListeners();
  }

  void setLoginResult(LoginResponseModel response) {
    _loginResult = response;
  }

  void login({required String userEmail, required String password}) async {
    setLoginState(LoginStates.loading);
    Either<Failure, LoginResponseModel> reponse = await _services.login(
      userEmail: userEmail,
      password: password,
    );
    reponse.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setLoginResult(LoginResponseModel(
              status: false, message: OFFLINE_ERROR_MESSAGE));
        } else {
          setLoginResult(
              LoginResponseModel(status: false, message: SERVER_ERROR_MESSAGE));
        }
        setLoginState(LoginStates.error);
      },
      (model) {
        setLoginResult(
            LoginResponseModel(status: model.status, message: model.message));
        if (model.status == true) {
          _cacheHelper.saveData(USER_TOKEN_KEY, model.userData!.token);
          setLoginState(LoginStates.success);
        } else {
          setLoginState(LoginStates.error);
        }
      },
    );
  }
}
