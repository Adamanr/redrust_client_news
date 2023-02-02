import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailPage extends StatefulWidget{
  final PageController? controller;
  const EmailPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EmailWidget();
  }
}

class _EmailWidget extends State<EmailPage>{
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_double_arrow_left, color: Colors.white, size: 40,),
            onPressed: () { context.go('/');  },
          )),
      body:Column(
          children: [
            IconButton(onPressed: (){
              widget.controller?.animateToPage(1, duration: const Duration(seconds: 1), curve: Curves.easeInSine);
            }, icon: const Icon(Icons.add)),
            Container(
              margin: const EdgeInsets.only(top: 90, bottom: 40),
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
            SizedBox(
              width: 320,
              height:67,
              child: ElevatedButton(
                onPressed: () {
                  widget.controller?.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeInSine);
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