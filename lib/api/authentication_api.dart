import 'package:appemcosani/helpers/http_response.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://emcosani.herokuapp.com',)
  );
  //funcion registra que llama al metodo registrar de nuestra api
  Future<HttpResponse> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      //await Future.delayed(Duration(seconds: 2));
      final response = await _dio.post(
        '/api/register',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "email": email,
          "password": password,
          "name": username,
        },
      );
      //print(  response.data);

      return HttpResponse.success(response.data);
    } catch (e) {
      //print( e);
      int statusCode = -1;
      String message = "Error Desconocido";
      dynamic data;

      if (e is DioError) {
        message = e.message;
        final response1 = e.response;
        if (response1 != null) {
          statusCode = response1.statusCode!;
          message = response1.statusMessage!;
          data = response1.data;
        }
      }

      return HttpResponse.fail(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }

  //funcion login que llama al metodo login de nuestra api

  Future<HttpResponse> login({ 
    required String email,
    required String password,
  }) async {
    try {
      //await Future.delayed(Duration(seconds: 2));
      final response = await _dio.post(
        '/api/login',
        data: {
          "email": email,
          "password": password, 
        },
      );
      //print(  response.data);

      return HttpResponse.success(response.data);
    } catch (e) {
      //print( e);
      int statusCode = -1;
      String message = "Error Desconocido";
      dynamic data;

      if (e is DioError) {
        message = e.message;
        final response1 = e.response;
        if (response1 != null) {
          statusCode = response1.statusCode!;
          message = response1.statusMessage!;
          data = response1.data;
        }
      }

      return HttpResponse.fail(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }


}
