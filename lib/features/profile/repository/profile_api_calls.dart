import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';
import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';


abstract class ProfileApiCalls {
  Future<dynamic> editProfile(
      {required String token, required UserDataModel model});
  Future<dynamic> getProfile({
    required String token,
  });

}

class ProfileApiCallsImpl implements ProfileApiCalls {
  final Dio _dio = Dio();

  @override
  Future<dynamic> editProfile(
      {required String token, required UserDataModel model}) async {
    try {
      Response response = await _dio.put(
        ApiEndPoints.baseURL + ApiEndPoints.updateProfile,
        options: Options(
          headers: getAPIHeaders(token: token),
        ),
        queryParameters: {
          "name": model.name,
          "phone": model.phone,
          "email": model.email,
          "password": "123456",
          "image": "",
        },
      );
      dynamic responseMap = response.data['data'];
      // print(response);

      return Future.value(responseMap);
    } catch (e) {
      // print(e.toString());
      // return Future.value(unit);
    }
  }

  @override
  Future<dynamic> getProfile({required String token}) async {
    try {
      Response response = await _dio.get(
        ApiEndPoints.baseURL + ApiEndPoints.profile,
        options: Options(
          headers: getAPIHeaders(token: token),
        ),
      );
      dynamic responseMap = response.data['data'];
      // print(response);

      return Future.value(responseMap);
    } catch (e) {
      // print(e.toString());
    }
  }

}
