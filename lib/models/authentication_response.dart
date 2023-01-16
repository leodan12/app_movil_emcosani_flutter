import 'package:meta/meta.dart' show required;

class AuthenticationResponse{
  final String token;
  final int id;
  final String name;
  final String email;
  AuthenticationResponse({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    });

  static AuthenticationResponse fromJson(Map<String,dynamic> json){
    return AuthenticationResponse(
      token: json['token'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      );
  }
}