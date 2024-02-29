import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/components/methods/repository_methods.dart';
import 'package:e_commerce/features/orders/model/order_model.dart';
import 'package:e_commerce/features/orders/repository/orders_api_calls.dart';

abstract class OrdersServices {
  Future<Either<Failure, Unit>> removeOrder(
      {required String token, required String orderID});
  Future<Either<Failure, List<OrderModel>>> getOrders({required String token});
}

class OrdersServicesImpl implements OrdersServices {
  final OrdersApiCalls _apiCalls = OrdersApiCallsImpl();
  final NetworkInfo _networkInfo = NetworkInfoImpl();

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(
      {required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        List<dynamic> listOfDynamics = await _apiCalls.getOrders(token: token);
        List<Map<String, dynamic>> listOfMaps =
            convertFromListOfDynamicToListOfMaps(listOfDynamics);
        List<OrderModel> orders = [];
        for (var element in listOfMaps) {
          orders.add(OrderModel.fromJson(element));
        }
        return Right(orders);
      } catch (e) {
        // print(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeOrder(
      {required String token, required String orderID}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiCalls.removeOrder(orderID: orderID, token: token);

        return const Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
