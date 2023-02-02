import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  PageController? controller;
  AvatarPage({super.key, required this.controller});

  @override
  State<AvatarPage> createState() {
    return _AvatarWidget();
  }
}

class _AvatarWidget extends State<AvatarPage>{
  int _counter = 0;
  final List<String> _imageUrls = [
    'image/axolotl.png',
    'image/penguin.png',
    'image/walrus.png',
    'image/wildpig.png',
  ];
  final List<String> _texts = [
    'Мадкип',
    'Пиплап',
    'Валрейн',
    'Бибоп',
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_double_arrow_left, color: Colors.white, size: 40,),
          onPressed: () { widget.controller?.animateToPage(1, duration: Duration(seconds: 2), curve: Curves.easeInSine);  },
        )),
      backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
      body: Center(
        child:Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(top:60, bottom: 40),
                child: Text("Выбор аватара", style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'Nunito', fontWeight: FontWeight.bold))),
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(top:10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                 color: const Color.fromRGBO(233, 233, 233, 10),
                  border: Border.all(
                    color: const Color.fromRGBO(233, 233, 233, 10),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: Image(image:AssetImage(_imageUrls[_counter])),
            ),
            Text(_texts[_counter], style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: 'Nunito'
            )),
            Padding(
                padding: const EdgeInsets.only(left: 88, bottom: 40),
                child:Row(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      if(_counter != 0){
                        _counter--;
                      }
                    });
                  }, icon: const Icon(Icons.arrow_circle_left_outlined, color:Colors.white, size: 75)),
                  IconButton(onPressed: (){
                    setState(() {
                      if(_imageUrls.length-1 != _counter){
                        _counter++;
                      }
                    });
                  }, icon: const Icon(Icons.arrow_circle_right_outlined, color:Colors.white, size: 75))
                ],
              )
            ),
            SizedBox(
              width: 320,
              height:67,
              child: ElevatedButton(
                onPressed: () {
                  widget.controller?.animateToPage(1, duration: const Duration(seconds: 1), curve: Curves.easeInSine);
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
          ],
        ),
      )
    );
  }
}
