import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailPasswordPage extends StatefulWidget {
  final PageController? controller;
  const EmailPasswordPage({super.key, required this.controller});

  @override
  State<EmailPasswordPage> createState() {
    return _EmailPasswordPage();
  }
}

class _EmailPasswordPage extends State<EmailPasswordPage> {
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_double_arrow_left, color: Colors.white, size: 40,),
            onPressed: () { context.go('/');  },
          )),
      backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
      resizeToAvoidBottomInset: false,
      body:Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
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
          Padding(padding: const EdgeInsets.only(bottom: 20, top: 10),
            child:Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
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
                Padding(padding: EdgeInsets.only(bottom: 10, left: 10),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(sync){
                            sync = false;
                          }else{
                            sync = true;
                          }
                        });
                      },
                      child:Text(
                        "Запомнить в системе",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Nunito'),
                      ),
                    ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 320,
            height:67,
            child: ElevatedButton(
              onPressed: () {
                widget.controller?.animateToPage(2, duration: const Duration(seconds: 1), curve: Curves.easeIn);
                // authUser(
                //     emailController.text, passwordController.text)
                //     .then((value) => {
                //   if (value) {
                //     Navigator.pushReplacement(
                //         context,MaterialPageRoute(builder: (context) => const HomePage())
                //     ),
                //   }else{
                //     setState(() {
                //   _selectedCard = 0;
                // }),
                //   }
                // });
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
        ]
      ),
    );
  }
}
