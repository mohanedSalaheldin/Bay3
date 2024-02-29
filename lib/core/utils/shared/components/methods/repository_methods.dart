import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';

List<Map<String, dynamic>> convertFromListOfDynamicToListOfMaps(
    List<dynamic> dynamicList) {
  List<Map<String, dynamic>> mapList = dynamicList.map((item) {
    return item as Map<String, dynamic>;
  }).toList();
  return mapList;
}

Future<Either<Failure, List<ProductModel>>> getProducts(
    Future<List<dynamic>> Function()
        getClothesOrCoronaOrElectronicsOrSports) async {
  final NetworkInfo networkInfo = NetworkInfoImpl();
  if (await networkInfo.isConnected) {
    try {
      List<dynamic> listOfDynamics =
          await getClothesOrCoronaOrElectronicsOrSports();
      List<Map<String, dynamic>> listOfMaps =
          convertFromListOfDynamicToListOfMaps(listOfDynamics);
      List<ProductModel> products = [];
      for (var element in listOfMaps) {
        products.add(ProductModel.fromJson(element));
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
