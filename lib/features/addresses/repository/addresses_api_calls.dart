import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';

abstract class AddressesApiCalls {
  Future<Unit> addAddress({required String token, required AddressModel model});
  Future<Unit> removeAddress(
      {required String token, required String addressID});
  Future<List<dynamic>> getAddresses({required String token});
}

class AddressesApiCallsImpl implements AddressesApiCalls {
  final Dio _dio = Dio();

  @override
  Future<Unit> addAddress(
      {required String token, required AddressModel model}) async {
    try {
      await _dio.post(
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
      // print(response.data);

      return Future.value(unit);
    } catch (e) {
      // print(e.toString());
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
      return Future.value(responseMap);
    } catch (e) {
      // print(e.toString());
      return [];
    }
  }

  @override
  Future<Unit> removeAddress(
      {required String token, required String addressID}) async {
    try {
     await _dio.delete(
        '${ApiEndPoints.baseURL}${ApiEndPoints.addresses}/$addressID',
        options: Options(
          headers: getAPIHeaders(token: token),
        ),
      );
      // print(response.data);

      return Future.value(unit);
    } catch (e) {
      // print(e.toString());
      return Future.value(unit);
    }
  }
}
