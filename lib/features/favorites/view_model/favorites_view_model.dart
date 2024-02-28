import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/favorites/repository/favorites_services.dart';
import 'package:e_commerce/features/product/model/favorite_and_cart_product_model.dart';
import 'package:flutter/material.dart';

enum FavoritesStates {
  notRequested,
  loading,
  serverError,
  connectionError,
  success,
  addOrRemoveSuccess,
  addOrRemoveError,
}

class FavoritesViewModel with ChangeNotifier {
  final FavoritesServices _favoritesServices = FavoritesServicesImpl();

  FavoritesStates _favoritesState = FavoritesStates.notRequested;

  void setFavoritesState(FavoritesStates newStete) {
    _favoritesState = newStete;
    notifyListeners();
  }

  FavoritesStates get favoritesStates => _favoritesState;

  List<FavoriteOrCartProductModel> _favoritessProducts = [];

  List<FavoriteOrCartProductModel> get favoritessProducts =>
      _favoritessProducts;

  void getFavorites() {
    setFavoritesState(FavoritesStates.loading);
    _getFavorites();
  }

  void _getFavorites() async {
    Either<Failure, List<FavoriteOrCartProductModel>> respose =
        await _favoritesServices.getFavoritesProducts(token:  USER_TOKEN_VALUE);
    respose.fold(
      (failure) {
        setFavoritesState(FavoritesStates.addOrRemoveError);
      },
      (favoritess) {
        _favoritessProducts = favoritess;

        setFavoritesState(FavoritesStates.addOrRemoveSuccess);
      },
    );
  }

  void removeFavoritesItem(
      FavoriteOrCartProductModel product, int index) async {
    _favoritessProducts.removeAt(index);
    Either<Failure, Unit> respose = await _favoritesServices.removeFavorites(
        token: USER_TOKEN_VALUE, productID: product.id);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setFavoritesState(FavoritesStates.connectionError);
        } else {
          setFavoritesState(FavoritesStates.serverError);
        }
      },
      (_) {
        setFavoritesState(FavoritesStates.success);
      },
    );
    _getFavorites();
  }
}
