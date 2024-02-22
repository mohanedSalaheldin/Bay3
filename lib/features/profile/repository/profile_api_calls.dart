import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';
import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';
import 'package:e_commerce/features/auth/model/login_response.dart';
import 'package:e_commerce/features/profile/model/address_model.dart';

abstract class ProfileApiCalls {
  Future<dynamic> editProfile(
      {required String token, required UserDataModel model});
  Future<dynamic> getProfile({
    required String token,
  });
  Future<Unit> addAddress({required String token, required AddressModel model});
  Future<Unit> removeAddress(
      {required String token, required String addressID});
  Future<List<dynamic>> getAddresses({required String token});
  Future<Unit> removeOrder({required String token, required String addressID});
  Future<List<dynamic>> getOrders({required String token});
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
      print(response);

      return Future.value(responseMap);
    } catch (e) {
      print(e.toString());
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
      print(e.toString());
    }
  }

  @override
  Future<Unit> addAddress(
      {required String token, required AddressModel model}) async {
    try {
      Response response = await _dio.post(
        ApiEndPoints.baseURL + ApiEndPoints.addresses,
        queryParameters: {
          "name": model.name,
          "city": model.city,
          "region": model.region,
          "details": model.details,
          "latitude": 30.0616863,
          "longitude": 31.3260088,
          "notes": model.notes,
        },
        options: Options(
          headers: getAPIHeaders(token: token),
        ),
      );
      print(response.data);

      return Future.value(unit);
    } catch (e) {
      print(e.toString());
      return Future.value(unit);
    }
  }

  @override
  Future<List> getAddresses({required String token}) async {
    try {
      Response response = await _dio.get(
        ApiEndPoints.baseURL + ApiEndPoints.addresses,
        options: Options(
          headers: getAPIHeaders(token: token),
        ),
      );
      List responseMap = response.data['data']['data'];
      // print(response);

      return Future.value(responseMap);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Future<List> getOrders({required String token}) {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeAddress(
      {required String token, required String addressID}) async {
    try {
      Response response = await _dio.delete(
        '${ApiEndPoints.baseURL}${ApiEndPoints.addresses}/$addressID',
        options: Options(
          headers: getAPIHeaders(token: token),
        ),
      );
      print(response.data);

      return Future.value(unit);
    } catch (e) {
      print(e.toString());
         return Future.value(unit);
    }
  }

  @override
  Future<Unit> removeOrder({required String token, required String addressID}) {
    // TODO: implement removeOrder
    throw UnimplementedError();
  }

  // @override
  // Future<Unit> addOrRemoveFavorite(
  //     {required String token, required int productID}) async {
  //   try {
  //     Response response = await _dio.post(
  //       ApiEndPoints.baseURL + ApiEndPoints.favorites,
  //       queryParameters: {"product_id": productID},
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'lang': 'en',
  //           'Authorization': token,
  //         },
  //       ),
  //     );
  //     print(response.data['message']);
  //     return unit;
  //   } on Exception {
  //     return unit;
  //   }
  // }

  // @override
  // Future<List> getFavorites({required String token}) async {
  //   try {
  //     Response response = await _dio.get(
  //       ApiEndPoints.baseURL + ApiEndPoints.favorites,
  //       options: Options(headers: {
  //         'Content-Type': 'application/json',
  //         'lang': 'en',
  //         'Authorization': token,
  //       }),
  //     );
  //     dynamic responseMap = response.data['data'];
  //     if (responseMap == null) {
  //       return [];
  //     }
  //     return Future.value(responseMap['data']);
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  // }
}
