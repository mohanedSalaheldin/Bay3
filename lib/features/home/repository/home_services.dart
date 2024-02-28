import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/core/utils/shared/components/methods/repository_methods.dart';
import 'package:e_commerce/features/home/repository/home_api_calls.dart';

abstract class HomeServices {
  Future<Either<Failure, List<ProductModel>>> getElectonicsProducts(
      {required String token});
  Future<Either<Failure, List<ProductModel>>> getClothesProducts(
      {required String token});
  Future<Either<Failure, List<ProductModel>>> getConronaStaffsProducts(
      {required String token});
  Future<Either<Failure, List<ProductModel>>> getSportsProducts(
      {required String token});

}

class HomeServicesImpl implements HomeServices {
  final HomeApiCalls _homeApiCalls = HomeApiCallsImpl();


  @override
  Future<Either<Failure, List<ProductModel>>> getClothesProducts(
      {required String token}) async {
    return getProducts(() => _homeApiCalls.fetchClothesData(token: token));
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getConronaStaffsProducts(
      {required String token}) async {
    return getProducts(() => _homeApiCalls.fetchCoronaData(token: token));
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getElectonicsProducts(
      {required String token}) async {
    return getProducts(() => _homeApiCalls.fetchElectronicsData(token: token));
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getSportsProducts(
      {required String token}) async {
    return getProducts(() => _homeApiCalls.fetchSportsData(token: token));
  }

}
