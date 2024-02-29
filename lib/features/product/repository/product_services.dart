import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/components/methods/repository_methods.dart';
import 'package:e_commerce/features/Product/repository/Product_api_calls.dart';
import 'package:e_commerce/features/product/model/favorite_and_cart_product_model.dart';

abstract class ProductServices {
  Future<Either<Failure, List<FavoriteOrCartProductModel>>> getFavoriteProducts(
      {required String token});
  Future<Either<Failure, Unit>> addOrRemoveFavorite(
      {required String token, required int productID});
  Future<Either<Failure, List<FavoriteOrCartProductModel>>> getCartProducts(
      {required String token});
  Future<Either<Failure, Unit>> addOrRemoveCart(
      {required String token, required int productID});
}

class ProductServicesImpl implements ProductServices {
  final ProductApiCalls _productApiCalls = ProductApiCallsImpl();
  final NetworkInfo _networkInfo = NetworkInfoImpl();

  @override
  Future<Either<Failure, Unit>> addOrRemoveFavorite(
      {required String token, required int productID}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _productApiCalls.addOrRemoveFavorite(
            token: token, productID: productID);
        return const Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<FavoriteOrCartProductModel>>> getFavoriteProducts(
      {required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        List<dynamic> listOfDynamics =
            await _productApiCalls.getFavorites(token: token);
        List<Map<String, dynamic>> listOfMaps =
            convertFromListOfDynamicToListOfMaps(listOfDynamics);
        List<FavoriteOrCartProductModel> products = [];
        for (var element in listOfMaps) {
          products.add(FavoriteOrCartProductModel.fromJson(element['product']));
        }
        return Right(products);
      } catch (e) {
        // print(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addOrRemoveCart(
      {required String token, required int productID}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _productApiCalls.addOrRemoveCart(
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
      {required String token}) async{
    if (await _networkInfo.isConnected) {
      try {
        List<dynamic> listOfDynamics =
            await _productApiCalls.getCart(token: token);
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
}
