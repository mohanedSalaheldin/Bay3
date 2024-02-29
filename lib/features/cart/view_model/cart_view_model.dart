import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/cart/repository/cart_services.dart';
import 'package:e_commerce/features/product/model/favorite_and_cart_product_model.dart';
import 'package:flutter/material.dart';

enum CartStates {
  notRequested,
  loading,
  serverError,
  connectionError,
  success,
  addOrRemoveSuccess,
  addOrRemoveError,
  payDone
}

class CartViewModel with ChangeNotifier {
  final CartServices _cartServices = CartServicesImpl();

  CartStates _cartState = CartStates.notRequested;

  void setCartState(CartStates newStete) {
    _cartState = newStete;
    notifyListeners();
  }

  CartStates get cartStates => _cartState;

  List<FavoriteOrCartProductModel> _cartsProducts = [];

  List<FavoriteOrCartProductModel> get cartsProducts => _cartsProducts;

  int _total = 0;
  int get total => _total;
  void _calculateTotal() {
    double total = 0;

    for (var i = 0; i < _cartsProducts.length; i++) {
      total += (_cartsProducts[i].price);
    }
    _total = total.ceil();
    notifyListeners();
  }

  void getCarts() {
    setCartState(CartStates.loading);
    _getCarts();
  }

  void _getCarts() async {
    Either<Failure, List<FavoriteOrCartProductModel>> respose =
        await _cartServices.getCartProducts(token: USER_TOKEN_VALUE);
    respose.fold(
      (failure) {
        setCartState(CartStates.addOrRemoveError);
      },
      (carts) {
        List<int> listOfIDs = [];
        for (var element in carts) {
          // print(element.name);
          listOfIDs.add(element.id);
        }
        _cartsProducts = carts;

        _calculateTotal();
        setCartState(CartStates.addOrRemoveSuccess);
      },
    );
  }

  void removeCartItem(FavoriteOrCartProductModel product, int index) async {
    _cartsProducts.removeAt(index);
    _calculateTotal();
    Either<Failure, Unit> respose = await _cartServices.addOrRemoveCart(
        token: USER_TOKEN_VALUE, productID: product.id);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setCartState(CartStates.connectionError);
        } else {
          setCartState(CartStates.serverError);
        }
      },
      (_) {
        setCartState(CartStates.success);
      },
    );

    _getCarts();
  }

  void confirmPayment({required int addressID}) async {
    Either<Failure, Unit> respose = await _cartServices.confirmPayment(
        token: USER_TOKEN_VALUE, addressID: addressID);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setCartState(CartStates.connectionError);
        } else {
          setCartState(CartStates.serverError);
        }
      },
      (_) {
        setCartState(CartStates.payDone);
        _getCarts();
      },
    );
  }
}
