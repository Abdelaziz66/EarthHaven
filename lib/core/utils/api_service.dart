import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = '';

  Future<Response> post(
      {required String endPoint,
      required String token,
      required data,
      String? contentType,
      Map<String, String>? headers}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: data,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': 'Bearer $token'},
        ));
    return response;
  }
}
