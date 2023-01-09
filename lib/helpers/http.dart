import 'package:appemcosani/helpers/http_response.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;

class Http {
  late Dio _dio;
  late bool _logsEnabled;

  Http({
    required Dio dio,
    required bool logsEnabled,
  }) {
    _dio = dio;
    _logsEnabled = logsEnabled;
  }

  Future<HttpResponse<T>> request<T>(
    String path, {
    method = 'GET',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    T Function(dynamic data)? parser,

  }) async {
    try {
      //await Future.delayed(Duration(seconds: 2));
      final response = await _dio.request(
        path,
        options: Options(
          method: method,
          headers: headers,
        ),
        queryParameters: queryParameters,
        data: data,
      );
      //print(  response.data);
      if(parser != null){
        return HttpResponse.success<T>(parser(response.data));
      }else{
      return HttpResponse.success<T>(response.data);}
    } catch (e) {
      //print( e);
      int statusCode = -3;
      String message = "Error Desconocido";
      dynamic data;

      if (e is DioError) {
        statusCode = -1;
        message = e.message;
        final response1 = e.response;
        if (response1 != null) {
          statusCode = response1.statusCode!;
          message = response1.statusMessage!;
          data = response1.data;
        }
      }

      return HttpResponse.fail<T>(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }
}
