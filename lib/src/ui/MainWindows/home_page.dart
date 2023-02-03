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
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
          color: Color.fromRGBO(40, 43, 75, 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('image/news.png'),color: Colors.white, size: 35)),
            IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('image/find.png'),color: Colors.white , size: 35)),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 0, 204, 10),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 0, 204, 10),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.home, color: Colors.white, size:40)),
            ),
            IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('image/group.png'),color: Colors.white , size: 35)),
            IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('image/settings.png'),color: Colors.white , size: 35))
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(39, 40, 63, 10),
                border: Border.all(
                  color: const Color.fromRGBO(39, 40, 63, 10),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 100,
                  child: const Image(
                    image: AssetImage('image/walrus.png'),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Adamanq', style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Nunito')),
                      Padding(padding: EdgeInsets.only(bottom: 2)),
                      Text('12 лайков', style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Nunito')),
                    ],
                  )
                )
              ],
            ),
          ),
          InkWell(
            onTap: (){

            },
            highlightColor: Colors.red,
           child: Container(
               margin: const EdgeInsets.only(left: 15, right: 15),
               height: 50,
               padding: EdgeInsets.only(left: 25),
               width:400,
               decoration: BoxDecoration(
                   color: Colors.white,
                   border: Border.all(
                     color: Colors.white,
                   ),
                   borderRadius: const BorderRadius.all(Radius.circular(20))
               ),
               child: Row(
                 children: const [
                   Text("12",style: TextStyle(color: Colors.red,fontSize: 30, fontFamily: 'Nunito')),
                   Padding(padding: EdgeInsets.only(left: 10, bottom: 15),
                     child: Text("новых статей",style: TextStyle(color: Colors.grey,fontSize: 32, fontFamily: 'Nunito')),
                   )
                 ],
               )
           ),
          ),
          Padding(padding: EdgeInsets.only(left: 15,right: 15),
          child:Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Container(
                  width: 160,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon( // <-- Icon
                      Icons.add_rounded,
                      size: 30,
                      color: Colors.white
                    ),
                    label: const Text('Создать', style: TextStyle(fontSize: 20, fontFamily: 'Nunito', color: Colors.white)), // <-- Text
                    style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(50, 50, 153, 10),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 160,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const ImageIcon(AssetImage("image/group.png")),
                    label: Text('Группы', style: TextStyle(fontSize: 20, fontFamily: 'Nunito')), // <-- Text
                  ),
                )
              ],
            ),
          )
          )
        ],
      ),
    );
  }
}