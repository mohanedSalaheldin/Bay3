import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';
import 'package:e_commerce/features/auth/model/login_response.dart';
import 'package:e_commerce/features/auth/model/register_response.dart';

abstract class AuthApiCalls {
  Future<LoginResponseModel> login({
    required String userEmail,
    required String password,
  });
  Future<RegisterResponseModel> register({
    required String userEmail,
    required String userName,
    required String password,
    required String phone,
    required String image,
  });
}

class AuthApiCallsImpl implements AuthApiCalls {
  final Dio _dio = Dio();

  @override
  Future<LoginResponseModel> login({
    required String userEmail,
    required String password,
  }) async {
    // print('******************(AuthApiCallsImpl)*****************');
    Response response = await _dio.post(
      ApiEndPoints.baseURL + ApiEndPoints.login,
      queryParameters: {
        "email": userEmail,
        "password": password,
      },
      options: Options(headers: {
        'Content-Type': 'application/json',
        'lang': 'en',
      }),
    );
    // print(response.data);

    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<RegisterResponseModel> register(
      {required String userEmail,
      required String userName,
      required String password,
      required String phone,
      required String image}) async {
    Response response = await _dio.post(
      ApiEndPoints.baseURL + ApiEndPoints.register,
      queryParameters: {
        "name": userName,
        "phone": phone,
        "email": userEmail,
        "password": password,
        "image": " "
      },
      options: Options(headers: {
        'Content-Type': 'application/json',
        'lang': 'en',
      }),
    );
    // print(response.data);

    return RegisterResponseModel.fromJson(response.data);
  }
}
