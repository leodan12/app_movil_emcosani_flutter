

import 'dart:convert';

import 'package:appemcosani/models/authentication_response.dart';
import 'package:appemcosani/models/session.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationClient {

  final FlutterSecureStorage _secureStorage;

  AuthenticationClient(this._secureStorage);

  Future<String?> get accessToken async {
    final data = await _secureStorage.read(key: 'SESSION');
    if(data != null){
      final session = Session.fromJson(jsonDecode(data));
      return session.token;
    }
    return null;
    }
    Future<int?> get accessId async {
    final data = await _secureStorage.read(key: 'SESSION');
    if(data != null){
      final session = Session.fromJson(jsonDecode(data));
      return session.id;
    }
    return null;
    }
    Future<String?> get accessName async {
    final data = await _secureStorage.read(key: 'SESSION');
    if(data != null){
      final session = Session.fromJson(jsonDecode(data));
      return session.name;
    }
    return null;
    }
    Future<String?> get accessEmail async {
    final data = await _secureStorage.read(key: 'SESSION');
    if(data != null){
      final session = Session.fromJson(jsonDecode(data));
      return session.email;
    }
    return null;
    }

  Future<void> saveSession(AuthenticationResponse authenticationResponse) async {
      final Session session = Session(
        token: authenticationResponse.token,
        id: authenticationResponse.id,
        name: authenticationResponse.name,
        email: authenticationResponse.email,
      );

      final data =jsonEncode(session.toJson());
      await _secureStorage.write(key: 'SESSION', value: data);
  }

  Future<void> singOut() async {
      await _secureStorage.deleteAll();
  }



}