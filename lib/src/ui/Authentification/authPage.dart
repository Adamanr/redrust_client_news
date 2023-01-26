import 'package:GoodNews/src/models/auth_request.dart';
import 'package:GoodNews/src/ui/HomePage.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() {
    return _AuthFunc();
  }
}

class _AuthFunc extends State<AuthPage> {
  int _selectedCard = -1;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool sync = false;
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
            children: [
              Container(
                margin: const EdgeInsets.only(top: 125, bottom: 40),
                child:const Image(image: AssetImage("image/dizzy.png"),width: 125,),
              ), 
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom:20),
                      child:Text("Введите почту",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Nunito'
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child:TextField(
                        controller: emailController,
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
                margin: const EdgeInsets.only(left: 20, right: 20,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom:20),
                      child:Text("Введите почту",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 32,
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
                          counterStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(fontSize: 20, color: Colors.white),
                          focusColor: Colors.white,
                          hintStyle:  const TextStyle(fontSize: 20, color: Colors.white),

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
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(left: 20, bottom: 10, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    child:Transform.scale(
                    scale: 2,
                    child: Checkbox(
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        value: sync,
                        checkColor: Colors.red,
                        activeColor: Colors.black,
                        onChanged: (bool? newValue) {
                          setState(() {
                            sync = newValue!;
                          });
                        })
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10, left: 10),
                    child: const Text(
                      "Запомнить в системе",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Nunito'),
                    ),
                  )

                ],
              ),
              Container(
                width: 320,
                height:67,
                child: ElevatedButton(
                  onPressed: () {
                    authUser(
                        emailController.text, passwordController.text)
                        .then((value) => {
                      if (value) {
                        Navigator.pushReplacement(
                            context,MaterialPageRoute(builder: (context) => const HomePage())
                        ),
                      }else{
                        setState(() {
                      _selectedCard = 0;
                    }),
                      }
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(34, 34, 87, 1)),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))
                          )
                      )
                  ),
                  child: const Text("Войти",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
               ),
            ),
              Container(
                width: 320,
                height:67,
                margin: const EdgeInsets.only(top:10),
                child: ElevatedButton(
                  onPressed: () {
                    authUser(
                        emailController.text, passwordController.text)
                        .then((value) => {
                      if (value) {
                        Navigator.pushReplacement(
                            context,MaterialPageRoute(builder: (context) => const HomePage())
                        ),
                      }else{
                        setState(() {
                          _selectedCard = 0;
                        }),
                      }
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))
                          )
                      )
                  ),
                  child: const Text("Регистрация",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
          ]
        ),
      )
    )
    );
  }
}
