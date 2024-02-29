import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/components/methods/repository_methods.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/features/search/repository/search_api_calls.dart';

abstract class SearchServices {
  Future<Either<Failure, List<ProductModel>>> getSearchs({
    required String token,
    required String keyword,
  });
}

class SearchServicesImpl implements SearchServices {
  final SearchApiCalls _searchApiCalls = SearchApiCallsImpl();
  final NetworkInfo _networkInfo = NetworkInfoImpl();

  @override
  Future<Either<Failure, List<ProductModel>>> getSearchs(
      {required String token,    required String keyword,}) async {
    if (await _networkInfo.isConnected) {
      try {
        List<dynamic> listOfDynamics =
            await _searchApiCalls.getSearchs(token: token, keyword: keyword);
        List<Map<String, dynamic>> listOfMaps =
            convertFromListOfDynamicToListOfMaps(listOfDynamics);
        List<ProductModel> searchs = [];
        for (var element in listOfMaps) {
          searchs.add(ProductModel.fromJson(element));
        }
        return Right(searchs);
      } catch (e) {
        // print(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
