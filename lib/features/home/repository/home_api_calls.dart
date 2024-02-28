import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';
import 'package:e_commerce/core/utils/shared/components/methods/api_calls.dart';

abstract class HomeApiCalls {
  Future<List<dynamic>> fetchElectronicsData({required String token});
  Future<List<dynamic>> fetchClothesData({required String token});
  Future<List<dynamic>> fetchSportsData({required String token});
  Future<List<dynamic>> fetchCoronaData({required String token});
  Future<List<dynamic>> getFavorites({required String token});
}

class HomeApiCallsImpl implements HomeApiCalls {
  @override
  Future<List<dynamic>> fetchElectronicsData({required String token}) async {
    return fetchSpacificCategory(ApiEndPoints.electonics, token);
  }

  @override
  Future<List> fetchClothesData({required String token}) {
    return fetchSpacificCategory(ApiEndPoints.clothes, token);
  }

  @override
  Future<List> fetchCoronaData({required String token}) {
    return fetchSpacificCategory(ApiEndPoints.corona, token);
  }

  @override
  Future<List> fetchSportsData({required String token}) {
    return fetchSpacificCategory(ApiEndPoints.sports, token);
  }

  @override
  Future<List> getFavorites({required String token}) {
    return fetchSpacificCategory(ApiEndPoints.favorites, token);
  }
}
