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
          color:Colors.white,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, "/");
                  },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(242, 52, 65, 100)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                        ),
                    ), child: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
              SizedBox(
                child: Column(
                  children: [
                    Center(

                    child:SizedBox(
                      width: 90,
                      height: 90,

                      child:ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48), // Image radius
                          child: Image.network('https://sun9-8.userapi.com/impg/WfXjVs4Ut_kxXQDdPFZkLMrbpmyPp8wk2HvVpg/ZyJg3jvTuTA.jpg?size=735x720&quality=95&sign=9b562c4f77a3ebbc299b6abad7d1155f&type=album', fit: BoxFit.cover),
                        ),
                      )
                    ),
                    ),
                    Container(
                      padding:const EdgeInsets.only(left: 3,top:7),
                      child: const Text("Артём", style: TextStyle(fontSize: 35, fontFamily: 'MultiroundPro', color: Colors.white))
                    ),
                  ],
                ),
              ),

              Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(168, 209, 231, 10),
                    ),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                   color: Color.fromRGBO(168, 209, 231, 10),
                ),
                child: Column (
                  children: [

                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: const Center(
                      child: Text("Авторизация",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cunia'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 330,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          ],
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                        width: 330,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          ],
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: 250,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 300,
                          height: 45,
                          child:ElevatedButton(
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
                          ),
                        ],
                      )
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
