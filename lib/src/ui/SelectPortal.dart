import 'package:GoodNews/src/blocks/Navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPortal extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _SelectPortalWidget();
  }
}

class _SelectPortalWidget extends State<SelectPortal>{

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
      appBar: AppBar(
      title: Text("Выбор портала"),
      ),
      drawer: NavBar(),
        body: ListView(
          padding: const EdgeInsets.only(left: 10,right: 10),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 40,
              child:InkWell(
                splashColor: Colors.lightBlue, // splash color
                onTap: () {}, // button pressed
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(left:10,right: 10),
                        child: const Icon(Icons.call,size: 30,color: Colors.lightBlue,)
                    ), // icon
                    const Text(
                        "Хабр",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'cunia'
                      ),
                    ), // text
                  ],
                ),
              )
            ),
            ElevatedButton(onPressed: ()=>null, child: Text("a")),
            ElevatedButton(onPressed: ()=>null, child: Text("a")),
            ElevatedButton(onPressed: ()=>null, child: Text("a")),
            ElevatedButton(onPressed: ()=>null, child: Text("a")),
            ElevatedButton(onPressed: ()=>null, child: Text("a")),
          ],
        )
      ),
    );
  }
}