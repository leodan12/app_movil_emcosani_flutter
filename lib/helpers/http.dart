
import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;


class Http {
  late Dio _dio;
  late bool _logsEnabled;

  Http({
    required Dio dio,
    required bool logsEnabled,
  }){
    _dio =dio;
    _logsEnabled=logsEnabled;
  }
}