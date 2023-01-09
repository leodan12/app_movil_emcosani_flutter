import 'package:meta/meta.dart' show required;

class AuthenticationResponse{
  final String token;

  AuthenticationResponse({
    required this.token,
    });

  static AuthenticationResponse fromJson(Map<String,dynamic> json){
    return AuthenticationResponse(token: json['token'],);
  }
}