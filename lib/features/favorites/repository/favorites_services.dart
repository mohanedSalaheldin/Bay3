import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/components/methods/repository_methods.dart';
import 'package:e_commerce/features/favorites/repository/favorites_api_calls.dart';
import 'package:e_commerce/features/product/model/favorite_and_cart_product_model.dart';

abstract class FavoritesServices {
  Future<Either<Failure, List<FavoriteOrCartProductModel>>>
      getFavoritesProducts({required String token});
  Future<Either<Failure, Unit>> removeFavorites(
      {required String token, required int productID});
}

class FavoritesServicesImpl implements FavoritesServices {
  final FavoritesApiCalls _favoritesApiCalls = FavoritesApiCallsImpl();
  final NetworkInfo _networkInfo = NetworkInfoImpl();

  @override
  Future<Either<Failure, Unit>> removeFavorites(
      {required String token, required int productID}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _favoritesApiCalls.removeFavoritesItem(
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
  Future<Either<Failure, List<FavoriteOrCartProductModel>>>
      getFavoritesProducts({required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        List<dynamic> listOfDynamics =
            await _favoritesApiCalls.getFavorites(token: token);
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
