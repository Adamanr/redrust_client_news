import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class User {
  final int id;
  final String email;
  final String password;

  const User({required this.id,required this.email, required this.password});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
  @override
  String toString() {
    return 'Dog{id: $id, email: $email, password: $password}';
  }
}

Future<bool> regUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://redrust.ru:9091/reg'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password
    }),
  );


  if (response.body.parseBool() == true) {
    return false;
  } else {
      WidgetsFlutterBinding.ensureInitialized();
      final database = openDatabase(
        join(await getDatabasesPath(), 'user.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE user(id INTEGER PRIMARY KEY, email TEXT, password TEXT)',
          );
        },
        version: 1,
      );

      Future<void> insertUser(User user) async {
        final db = await database;
        await db.insert(
          'user',
          user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      var fido = User(
        id: 0,
        email:email ,
        password: password,
      );

      await insertUser(fido);
    return true;
  }
}
extension BoolParsing on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}

