import 'package:meta/meta.dart' show required;

class Session{
  final String token;

  Session({
    required this.token,});

static Session fromJson(Map<String,dynamic> json){ 
  return Session(token: json['token'],);
}

Map<String,dynamic> toJson() {
  return {
    "token": this.token,
  };
}
}