
import 'package:appemcosani/api/authentication_api.dart';
import 'package:appemcosani/data/authentication_client.dart';
import 'package:appemcosani/helpers/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final AuthenticationClient authenticationClient = AuthenticationClient(secureStorage);
    GetIt.instance.registerSingleton<AuthenticationClient>(authenticationClient);


  }
}