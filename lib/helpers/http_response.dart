import 'package:appemcosani/models/authentication_response.dart';
import 'package:meta/meta.dart' show required;

class HttpResponse<T> {
  final T? data;
  final HttpError error;

  HttpResponse(this.data, this.error);


  static HttpResponse<T> success<T>(T data) {
   HttpError error =  HttpError(data: data,message: "sin error",statusCode: -2);
    return HttpResponse(data,error );
  } 

  
  static HttpResponse<T> fail<T>({
    required int statusCode, 
    required String message, 
    required dynamic data,
    }) {
     
     
    return HttpResponse(
      null,   //aca era null
      HttpError(
        statusCode: statusCode, 
        message: message, 
        data: data,
        ));
  }
}


class HttpError {
  final int statusCode;
  final String message;
  final dynamic data;

  HttpError({
    required this.statusCode, 
    required this.message, 
    required this.data,
    });

}