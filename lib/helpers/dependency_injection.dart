
import 'package:appemcosani/api/authentication_api.dart';
import 'package:appemcosani/helpers/http.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjection{
  static void initialize(){
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://emcosani.herokuapp.com',
        
        ),
    );
    Http http = Http(
      dio: dio,
      logsEnabled: true,
      );
    
    final AuthenticationAPI authenticationAPI =AuthenticationAPI(http) ;

    GetIt.instance.registerSingleton<AuthenticationAPI>(authenticationAPI);
  }
}