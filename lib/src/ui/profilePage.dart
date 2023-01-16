import 'dart:convert';

import 'package:GoodNews/src/blocks/Navbar.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _profileWidget();
  }
}

class _profileWidget extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Новости"),
      ),
      drawer: NavBar(),

      body: Column(
        children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 16, left: 16),
                  width: 130,
                  height: 130,

                  child:ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(60), // Image radius
                      child: Image.network('https://sun9-8.userapi.com/impg/WfXjVs4Ut_kxXQDdPFZkLMrbpmyPp8wk2HvVpg/ZyJg3jvTuTA.jpg?size=735x720&quality=95&sign=9b562c4f77a3ebbc299b6abad7d1155f&type=album', fit: BoxFit.cover),
                    ),
                  )
              ),
              Container(
                  width: 180,
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                //mainAxisSize: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Book Name"),
                  Text("Author name"),
                  Divider(
                      color: Colors.black
                  )
                ],
              )
              )
              
            ],
          )

        ],
      ),
    );
  }
}