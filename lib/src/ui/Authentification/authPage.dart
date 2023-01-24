import 'package:GoodNews/src/models/auth_request.dart';
import 'package:GoodNews/src/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class Auth extends StatefulWidget {
  @override
  State<Auth> createState() {
    return _AuthFunc();
  }
}

class _AuthFunc extends State<Auth> {
  int _selectedCard = -1;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
          color:const Color.fromRGBO(22, 22, 50, 10),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Почта",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'MultiroundPro'
                ),
              ),
              //
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey, width: 2.0),
                  ),
                  hintText: "Почта",
                ),
              ),
              const Text("Пароль",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'MultiroundPro'
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey, width: 2.0),
                  ),
                  hintText: "Пароль",
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  authUser(
                      emailController.text, passwordController.text)
                      .then((value) => {
                    if (value) {
                      Navigator.pushReplacement(
                          context,MaterialPageRoute(builder: (context) => HomePage())
                      ),
                    }else{
                      setState(() {
                    _selectedCard = 0;
                  }),
                    }
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(247, 109, 109, 1)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                    )
                ),
                child: const Text("Войти",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'cunia',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ]
        ),
      )
    )
    );
  }
}
