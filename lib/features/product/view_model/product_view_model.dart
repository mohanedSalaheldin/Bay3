import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/product/model/favorite_and_cart_product_model.dart';
import 'package:e_commerce/features/product/repository/product_services.dart';
import 'package:flutter/material.dart';

enum ProductStates {
  notRequested,
  loading,
  serverError,
  connectionError,
  success,
  addOrRemoveSuccess,
  addOrRemoveError,
}

class ProductViewModel with ChangeNotifier {
  final ProductServices _productServices = ProductServicesImpl();

  ProductStates _productState = ProductStates.notRequested;

  void setProductState(ProductStates newStete) {
    _productState = newStete;
    notifyListeners();
  }

  ProductStates get productStates => _productState;

  List<FavoriteOrCartProductModel> _favoriteProducts = [];

  List<FavoriteOrCartProductModel> get favoriteProducts => _favoriteProducts;
  List<FavoriteOrCartProductModel> _cartProducts = [];

  List<FavoriteOrCartProductModel> get cartProducts => _cartProducts;

  void getFavorites() {
    setProductState(ProductStates.loading);
    _getFavorites();
  }

  void getCarts() {
    setProductState(ProductStates.loading);
    _getCarts();
  }

  void _getFavorites() async {
    String token = USER_TOKEN_VALUE;

    Either<Failure, List<FavoriteOrCartProductModel>> respose =
        await _productServices.getFavoriteProducts(token: token);
    respose.fold(
      (failure) {
        setProductState(ProductStates.addOrRemoveError);
      },
      (products) {
        _favoriteProducts = products;
        setProductState(ProductStates.addOrRemoveSuccess);
      },
    );
  }

  void _getCarts() async {
    String token = USER_TOKEN_VALUE;

    Either<Failure, List<FavoriteOrCartProductModel>> respose =
        await _productServices.getCartProducts(token: token);
    respose.fold(
      (failure) {
        setProductState(ProductStates.addOrRemoveError);
      },
      (products) {
        _cartProducts = products;
        setProductState(ProductStates.addOrRemoveSuccess);
      },
    );
  }

  void addOrRemoveFavoriteProduct(ProductModel product) async {
    int index = -1;
    for (var i = 0; i < _favoriteProducts.length; i++) {
      if (_favoriteProducts[i].id == product.id) {
        index = i;
      }
    }
    if (index == -1) {
      _favoriteProducts.add(FavoriteOrCartProductModel(
          id: product.id,
          price: product.price,
          oldPrice: product.oldPrice,
          discount: product.discount,
          image: product.image,
          name: product.name,
          description: product.description));
    } else {
      _favoriteProducts.removeAt(index);
    }
    notifyListeners();
    Either<Failure, Unit> respose = await _productServices.addOrRemoveFavorite(
        token: USER_TOKEN_VALUE, productID: product.id);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setProductState(ProductStates.connectionError);
        } else {
          setProductState(ProductStates.serverError);
        }
      },
      (_) {
        setProductState(ProductStates.success);
      },
    );
    _getFavorites();
  }

  void addOrRemoveCartProduct(ProductModel product) async {
    int index = -1;
    for (var i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i].id == product.id) {
        index = i;
      }
    }
    if (index == -1) {
      _cartProducts.add(FavoriteOrCartProductModel(
          id: product.id,
          price: product.price,
          oldPrice: product.oldPrice,
          discount: product.discount,
          image: product.image,
          name: product.name,
          description: product.description));
    } else {
      _cartProducts.removeAt(index);
    }
    notifyListeners();
    Either<Failure, Unit> respose = await _productServices.addOrRemoveCart(
        token: USER_TOKEN_VALUE, productID: product.id);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setProductState(ProductStates.connectionError);
        } else {
          setProductState(ProductStates.serverError);
        }
      },
      (_) {
        setProductState(ProductStates.success);
      },
    );
    _getCarts();
  }
}
