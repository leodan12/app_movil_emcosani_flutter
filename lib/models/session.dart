import 'package:meta/meta.dart' show required;

class Session{
  final String token;
  final int id;
  final String name;
  final String email;

  Session({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    });

static Session fromJson(Map<String,dynamic> json){ 
  return Session(
    token: json['token'], 
    id: json['id'],
    name: json['name'], 
    email: json['email'],
    );
}

Map<String,dynamic> toJson() {
  return {
    "token": this.token,
     "id": this.id,
     "name": this.name,
     "email": this.email,
  };
}
}