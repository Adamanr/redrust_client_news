import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:go_router/go_router.dart';

class CodePage extends StatefulWidget{
  PageController? controller;
  CodePage({super.key, required this.controller});

  @override
  State<CodePage> createState() {
    return _CodePage();
  }
}

class _CodePage extends State<CodePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_double_arrow_left, color: Colors.white, size: 40,),
            onPressed: () { widget.controller?.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.easeInSine);  },
          )),
      backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
      body: Center(
        child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top:200, bottom: 100),
            child:VerificationCode(
              keyboardType: TextInputType.number,
              length: 4,
              itemSize: 70,
              onCompleted: (String value) {
                print(value);
              }, onEditing: (bool value) {  },
              textStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              fillColor: Colors.white,
            )
          ),
          InkWell(
            onTap: (){

            },
            child: const Text("Отправить код снова", style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            width: 320,
            height:67,
            child: ElevatedButton(
              onPressed: () {
                context.go('/Home');
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
        ],
      ),
      )
    );
  }
}