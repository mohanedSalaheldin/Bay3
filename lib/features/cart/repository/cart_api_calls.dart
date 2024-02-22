import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';

abstract class CartApiCalls {
  Future<Unit> addOrRemoveCartItem(
      {required String token, required int productID});

  Future<List<dynamic>> getCart({required String token});
}

class CartApiCallsImpl implements CartApiCalls {
  final Dio _dio = Dio();

  @override
  Future<Unit> addOrRemoveCartItem(
      {required String token, required int productID}) async {
    try {
      Response response = await _dio.post(
        ApiEndPoints.baseURL + ApiEndPoints.carts,
        queryParameters: {"product_id": productID},
        options: Options(
          headers: getAPIHeaders(token: token),
        ),
      );
      print(response.data['message']);
      return unit;
    } on Exception {
      return unit;
    }
  }

  @override
  Future<List> getCart({required String token}) async {
    try {
      Response response = await _dio.get(
        ApiEndPoints.baseURL + ApiEndPoints.carts,
        options: Options(headers: getAPIHeaders(token: token)),
      );
      dynamic responseMap = response.data['data'];
      if (responseMap == null) {
        return [];
      }
      return Future.value(responseMap['cart_items']);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
