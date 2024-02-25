import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/components/methods/repository_methods.dart';
import 'package:e_commerce/features/cart/repository/cart_api_calls.dart';
import 'package:e_commerce/features/product/model/favorite_and_cart_product_model.dart';

abstract class CartServices {
  Future<Either<Failure, List<FavoriteOrCartProductModel>>> getCartProducts(
      {required String token});
  Future<Either<Failure, Unit>> addOrRemoveCart(
      {required String token, required int productID});
  Future<Either<Failure, Unit>> confirmPayment(
      {required String token, required int addressID});
}

class CartServicesImpl implements CartServices {
  final CartApiCalls _cartApiCalls = CartApiCallsImpl();
  final NetworkInfo _networkInfo = NetworkInfoImpl();

  @override
  Future<Either<Failure, Unit>> addOrRemoveCart(
      {required String token, required int productID}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _cartApiCalls.addOrRemoveCartItem(
            productID: productID, token: token);
        return const Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<FavoriteOrCartProductModel>>> getCartProducts(
      {required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        List<dynamic> listOfDynamics =
            await _cartApiCalls.getCart(token: token);
        List<Map<String, dynamic>> listOfMaps =
            convertFromListOfDynamicToListOfMaps(listOfDynamics);
        List<FavoriteOrCartProductModel> products = [];
        for (var element in listOfMaps) {
          products.add(FavoriteOrCartProductModel.fromJson(element['product']));
        }
        return Right(products);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmPayment(
      {required String token,
      required int addressID}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _cartApiCalls.confirmPayment(
            addressID: addressID, token: token,);
        return const Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
