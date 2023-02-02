import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordPage extends StatefulWidget {
  PageController? controller;
  PasswordPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() {
    return _PasswordWidget();
  }
}

class _PasswordWidget extends State<PasswordPage> {
  final passwordController = TextEditingController();
  final subPasswordController = TextEditingController();

  @override
  void dispose(){
    passwordController.dispose();
    subPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_double_arrow_left, color: Colors.white, size: 40,),
            onPressed: () { widget.controller?.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.easeInSine);  },
          )),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
      body:Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: currentHeight/15, bottom: currentHeight/14),
              child:const Image(image: AssetImage("image/dizzy.png"),width: 125,),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(bottom:20),
                    child:Text("Введите пароль",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                          fontFamily: 'Nunito'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child:TextField(
                      controller: passwordController,
                      cursorColor: Colors.white,
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Nunito'
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(43,43, 71, 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(43,43, 71, 10), width: 0.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(bottom:20),
                    child:Text("Подтвердите пароль",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                          fontFamily: 'Nunito'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child:TextField(
                      controller: subPasswordController,
                      cursorColor: Colors.white,
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Nunito'
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(43,43, 71, 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(43,43, 71, 10), width: 0.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 320,
              height:67,
              child: ElevatedButton(
                onPressed: () {
                  widget.controller?.animateToPage(3, duration: const Duration(seconds: 1), curve: Curves.easeInSine);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(34, 34, 87, 1)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        )
                    )
                ),
                child: const Text("Продолжить",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}