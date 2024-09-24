import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://plant.id/';

  Future<Response> post(
      {required String endPoint,
       String? token,
      required data,
      String? contentType,
      Map<String, String>? headers}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: data,
        options: Options(
          contentType: contentType ?? 'application/json',
          headers: headers ?? {
            'Api-Key':'8hhjzbbm3n7qmS5qy2zb0TZd9mRe5Syknay9WazfNAWe3hRnev'
          },
        ));
    return response;
  }
}
