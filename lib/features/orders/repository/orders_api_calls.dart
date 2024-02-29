import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';

abstract class OrdersApiCalls {
  Future<Unit> removeOrder({required String token, required String orderID});
  Future<dynamic> getOrders({
    required String token,
  });
}

class OrdersApiCallsImpl implements OrdersApiCalls {
  final Dio _dio = Dio();

  @override
  Future<List> getOrders({required String token}) async {
    try {
      Response response = await _dio.get(
        ApiEndPoints.baseURL + ApiEndPoints.orders,
        options: Options(
          headers: getAPIHeaders(token: token),
        ),
      );
      List responseMap = response.data['data']['data'];
      // print(response.data);
      return Future.value(responseMap);
    } catch (e) {
      // print(e.toString());
      return [];
    }
  }

// orders/1/cancel
  @override
  Future<Unit> removeOrder(
      {required String token, required String orderID}) async {
    try {
      await _dio.get(
        '${ApiEndPoints.baseURL}${ApiEndPoints.orders}/$orderID+/cancle',
        options: Options(
          headers: {'Authorization': token},
        ),
      );

      return Future.value(unit);
    } catch (e) {
      // print(e.toString());
      return unit;
    }
  }
}

/**
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
      print(e.toString());
      return [];
    }
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
 */