import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/home/repository/home_services.dart';
import 'package:flutter/material.dart';

enum HomeStates {
  notRequested,
  loading,
  serverError,
  connectionError,
  success,
}

class HomeViewModel with ChangeNotifier {
  final HomeServices _homeServices = HomeServicesImpl();
  List<ProductModel> _coronaProducts = [];
  List<ProductModel> _electronicsProducts = [];
  List<ProductModel> _clothesProducts = [];
  List<ProductModel> _sportProducts = [];

  int _currentCategory = 0;
  int get currentCategory => _currentCategory;

  void setCategory(int newCategory) {
    _currentCategory = newCategory;
    notifyListeners();
  }

  HomeStates _homeState = HomeStates.notRequested;
  void setHomeState(HomeStates newStete) {
    _homeState = newStete;
    notifyListeners();
  }

  HomeStates get homeStates => _homeState;

  List<ProductModel> get electronicsProducts => _electronicsProducts;
  List<ProductModel> get clothesProducts => _clothesProducts;
  List<ProductModel> get sportProducts => _sportProducts;
  List<ProductModel> get coronaProducts => _coronaProducts;

  void fetchElectroncsProducts() async {
    setHomeState(HomeStates.loading);
    Either<Failure, List<ProductModel>> homeDataResponse = await _homeServices
        .getElectonicsProducts(token:USER_TOKEN_VALUE);
    homeDataResponse.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setHomeState(HomeStates.connectionError);
        } else {
          setHomeState(HomeStates.serverError);
        }
      },
      (products) {
        _electronicsProducts = products;
        setHomeState(HomeStates.success);
      },
    );
  }

  void fetchSportsProducts() async {
    setHomeState(HomeStates.loading);
    Either<Failure, List<ProductModel>> homeDataResponse = await _homeServices
        .getSportsProducts(token: USER_TOKEN_VALUE);
    homeDataResponse.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setHomeState(HomeStates.connectionError);
        } else {
          setHomeState(HomeStates.serverError);
        }
      },
      (products) {
        _sportProducts = products;
        setHomeState(HomeStates.success);
      },
    );
  }

  void fetchCoronaProducts() async {
    setHomeState(HomeStates.loading);
    Either<Failure, List<ProductModel>> homeDataResponse = await _homeServices
        .getConronaStaffsProducts(token: USER_TOKEN_VALUE);
    homeDataResponse.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setHomeState(HomeStates.connectionError);
        } else {
          setHomeState(HomeStates.serverError);
        }
      },
      (products) {
        _coronaProducts = products;
        setHomeState(HomeStates.success);
      },
    );
  }

  void fetchClothesProducts() async {
    setHomeState(HomeStates.loading);
    Either<Failure, List<ProductModel>> homeDataResponse = await _homeServices
        .getClothesProducts(token: USER_TOKEN_VALUE);
    homeDataResponse.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setHomeState(HomeStates.connectionError);
        } else {
          setHomeState(HomeStates.serverError);
        }
      },
      (products) {
        _clothesProducts = products;
        setHomeState(HomeStates.success);
      },
    );
  }
}
