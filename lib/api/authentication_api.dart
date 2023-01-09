import 'package:appemcosani/helpers/http.dart';
import 'package:appemcosani/helpers/http_response.dart';
import 'package:appemcosani/models/authentication_response.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Http _http;

  AuthenticationAPI(this._http);

  //funcion registra que llama al metodo registrar de nuestra api
  Future<HttpResponse<AuthenticationResponse>> register({
    required String username,
    required String email,
    required String password,
  }) {
    return _http.request<AuthenticationResponse>(
      '/api/register',
      method: 'POST',
      data: {
        "email": email,
        "password": password,
        "name": username,
      },
       parser: (data){
        return AuthenticationResponse.fromJson(data);
      },
    );
  }

  //funcion login que llama al metodo login de nuestra api

  Future<HttpResponse<AuthenticationResponse>> login({
    required String email,
    required String password,
  }) {
    return _http.request<AuthenticationResponse>(
      '/api/login',
      method: 'POST',
      data: {
        "email": email,
        "password": password, 
      },
      parser: (data){
        return AuthenticationResponse.fromJson(data);
      },
    );
  }
}
