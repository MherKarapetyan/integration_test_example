import 'dart:convert' show json;

class RequestBody {
  final String email;
  final String password;

  RequestBody({this.email, this.password});

  Map<String, dynamic> toMap() => {'email': email, 'password': password};
  String toJson() => json.encode({'email': email, 'password': password});
}
