import 'dart:io';

import 'package:GoodNews/src/models/reg_request.dart';
import 'package:GoodNews/src/ui/HomePage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class Reg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegWidget();
  }
}

class _RegWidget extends State<Reg> {

  late Color _subPass;
  int _selectEmailColor = -1;
  int _selectPasswordColor = -1;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final subPasswordController = TextEditingController();
  late Color _buttonColor;

  @override
  void initState() {
    //Начальное значение цвета кнопки
    _subPass = Colors.red;
    super.initState();
  }

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    subPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
               color: Colors.white,
                child:Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(168, 209, 231, 10),
                          ),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          color: Color.fromRGBO(168, 209, 231, 10),
                      ),
                      child: Column (
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top:10,bottom: 10),
                            child: const Text("Регистрация",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:37,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'cunia'
                              ),
                            ),
                            )
                          ),
                          Container(
                              width: 330,
                              margin:const EdgeInsets.only(bottom: 15),
                              child: Column(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(bottom: 5),
                                    child:  const Text("Почта",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'MultiroundPro'
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: _selectEmailColor == 0 ? Colors.red : Colors.grey, width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: _selectEmailColor == 0 ? Colors.red : Colors.grey, width: 2.0),
                                      ),
                                      hintText: "Почта",
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                              margin:const EdgeInsets.only(bottom: 15),
                              width: 330,
                              child: Column(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom:5),
                                    child: const Text("Пароль",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'MultiroundPro'
                                      ),
                                    ),
                                  )
                                  ,
                                  TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: _selectPasswordColor == 0 ? Colors.red : Colors.grey, width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: _selectPasswordColor == 0 ? Colors.red : Colors.grey, width: 2.0),
                                      ),
                                      hintText: "Введите ваш пароль",
                                    ),
                                  ),
                                ],
                              )
                          ),
                          SizedBox(
                              width: 330,
                              child: Column(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child:const Text("Подтвердите пароль",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'MultiroundPro'
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    controller: subPasswordController,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: _selectPasswordColor == 0 ? Colors.red : Colors.grey, width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _selectPasswordColor == 0 ? Colors.red : Colors.grey, width: 2.0),
                                        ),
                                      hintText: "Введите пароль повторно",
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, top:20),
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if(emailController.text.contains("@mail.ru")) {
                                  setState(() {
                                    _selectEmailColor = -1;
                                  });
                                  if (passwordController.text ==
                                      subPasswordController.text && passwordController.text.isNotEmpty) {
                                    regUser(
                                        emailController.text,
                                        passwordController.text)
                                        .then((value) =>
                                    {
                                      if (value) {

                                        insertDog(emailController.text, passwordController.text),
                                        Navigator.pushReplacement(
                                            context,MaterialPageRoute(builder: (context) => HomePage())
                                        ),
                                      }
                                    });
                                  } else {
                                    setState(() {
                                      _selectPasswordColor = 0;
                                    });
                                  }
                                }else{
                                  setState(() {
                                    _selectEmailColor = 0;
                                  });
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(247, 109, 109, 1)),
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      )
                                  )
                              ),
                              child: const Text("Создать аккаунт",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'MultiroundPro',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}

class User {
  final String email;
  final String password;

  const User({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}

Future<Database> getDB() async{

  Directory? appDocDir = await getExternalStorageDirectory();
  String? path = appDocDir?.path;

  return openDatabase(
      join(path!, 'session.db'),
    version: 1,
  );
}
Future<void> insertDog(email, password) async {
  final db = await getDB();


  var user = User(email: email, password: password);
  await db.insert(
    'user',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}