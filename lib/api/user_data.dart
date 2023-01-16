


import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;

class UserData{
  final Dio _dio =Dio();
  //final id = 3;
  Future datosUser(id) async {
    try {
    Response  response = await _dio.get(
      "https://emcosani.herokuapp.com/api/datosuser2/$id",
      options: Options(
        headers: {
          'Content-Type': 'application/json',
         },
      ), 
      
      );
      //print(response.data);
      //int userId = response.data['user']['id'];
      //print(userId);
    return response;
      }
      catch(e){
        print(e);
      }
    
  }

  
}