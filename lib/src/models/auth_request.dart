import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String email;
  final String password;

  const User({required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
    );
  }
}

Future<bool> authUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://redrust.ru:9091/auth'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password
    }),
  );


  if (response.body.parseBool() == true) {
    return true;
  } else {
    return false;
  }
}
extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}
