import 'package:flutter/material.dart';
import 'package:good_news/src/blocks/navbar_block.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeWidget();
  }
}

class _HomeWidget extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
      appBar: AppBar(
        automaticallyImplyLeading: false, // this will hide Drawer hamburger icon
        backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Text('Главная страница',style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 25)),
            Container(
              alignment: Alignment.centerRight,
              width: 50,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(41,44, 75, 10),
                    border: Border.all(
                      color: const Color.fromRGBO(41,44, 75, 10),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(40))
                ),
              child: InkWell(
                child: const Image(image: AssetImage("image/notification.png")),
                onTap: (){

                },
              )
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text("Hello")
        ],
      ),
    );
  }
}