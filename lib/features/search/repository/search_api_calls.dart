import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';

abstract class SearchApiCalls {
  Future<List<dynamic>> getSearchs({
    required String token,
    required String keyword,
  });
}

class SearchApiCallsImpl implements SearchApiCalls {
  final Dio _dio = Dio();

  @override
  Future<List> getSearchs({
    required String token,
    required String keyword,
  }) async {
    try {
      Response response = await _dio.post(
        ApiEndPoints.baseURL + ApiEndPoints.search,
        queryParameters: {
          "text": keyword,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          'Authorization': token,
        }),
      );
      dynamic responseMap = response.data['data'];
      if (responseMap == null) {
        return [];
      }
      return Future.value(responseMap['data']);
    } catch (e) {
      // print(e.toString());
      return [];
    }
  }
}
