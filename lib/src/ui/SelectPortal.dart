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
  var _containerColor = Colors.blue;
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
          padding: const EdgeInsets.all(5),
          children: [
            Container(
                height: 50,
                decoration: BoxDecoration(
                  color: _containerColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child:InkWell(
                  onLongPress: () {
                    setState(() {
                      _containerColor = Colors.red;
                    });
                  },
                  onTap: (){
                    if(_containerColor == Colors.red){
                      setState(() {
                        _containerColor = Colors.blue;
                      });
                    }
                  },
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(left:10,right: 10),
                          child: const Icon(Icons.call,size: 30,color: Colors.white,)
                      ), // icon
                      const Text(
                        "Хабр",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'MultiroundPro'
                        ),
                      ), // text
                    ],
                  ),
                )
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  color: _containerColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child:InkWell(
                  onLongPress: () {
                    setState(() {
                      _containerColor = Colors.red;
                    });
                  },
                  onTap: (){
                    if(_containerColor == Colors.red){
                      setState(() {
                        _containerColor = Colors.blue;
                      });
                    }
                  },
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(left:10,right: 10),
                          child: const Icon(Icons.call,size: 30,color: Colors.white,)
                      ), // icon
                      const Text(
                        "Хабр",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'MultiroundPro'
                        ),
                      ), // text
                    ],
                  ),
                )
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  color: _containerColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child:InkWell(
                  onLongPress: () {
                    setState(() {
                      _containerColor = Colors.red;
                    });
                  },
                  onTap: (){
                    if(_containerColor == Colors.red){
                      setState(() {
                        _containerColor = Colors.blue;
                      });
                    }
                  },
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(left:10,right: 10),
                          child: const Icon(Icons.call,size: 30,color: Colors.white,)
                      ), // icon
                      const Text(
                        "Хабр",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'MultiroundPro'
                        ),
                      ), // text
                    ],
                  ),
                )
            ),
          ],
        )
      ),
    );
  }
}