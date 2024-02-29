import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_endpoints.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';

Future<List<dynamic>> fetchSpacificCategory(
  String categoryEndPoint,
  String token,
) async {
  final Dio dio = Dio();
 
  try {
    Response response = await dio.get(
      ApiEndPoints.baseURL + categoryEndPoint,
      options: Options(headers: getAPIHeaders(token: token)),
    );
    return Future.value(response.data['data']['data']);
  } catch (e) {
    // print(e.toString());
    return [];
  }
}
