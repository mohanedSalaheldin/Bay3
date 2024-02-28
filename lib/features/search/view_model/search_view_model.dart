import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/search/repository/search_services.dart';
import 'package:flutter/material.dart';

enum SearchStates {
  notRequested,
  loading,
  serverError,
  connectionError,
  success,
  noItemFound,
}

class SearchViewModel with ChangeNotifier {
  final SearchServices _searchServices = SearchServicesImpl();

  SearchStates _searchStates = SearchStates.notRequested;

  void setSearchState(SearchStates newStete) {
    _searchStates = newStete;
    notifyListeners();
  }

  SearchStates get searchStates => _searchStates;

  List<ProductModel> _searchProducts = [];

  List<ProductModel> get searchProducts => _searchProducts;

  void resetSearchProducts() {
    _searchProducts = [];
    notifyListeners();
  }

  void getSearchs({required String keyword}) {
    setSearchState(SearchStates.loading);
    _getSearchs(keyword);
  }

  void _getSearchs(String keyword) async {
    String token = USER_TOKEN_VALUE;

    Either<Failure, List<ProductModel>> respose =
        await _searchServices.getSearchs(token: token, keyword: keyword);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setSearchState(SearchStates.connectionError);
        } else {
          setSearchState(SearchStates.serverError);
        }
      },
      (searchs) {
        _searchProducts = [];

        _searchProducts = searchs;
        if (searchs.isEmpty) {
          setSearchState(SearchStates.noItemFound);
        }
        else{
           setSearchState(SearchStates.success);
        }
      },
    );
  }
}
