import 'package:flutter/material.dart';
import 'package:good_news/src/blocks/navbar_bottom.dart';

class GroupPage extends StatefulWidget{
  GroupPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GroupWidget();
  }
}

class _GroupWidget extends State<GroupPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavbar(context),
      body: Column(
        children: const [

        ],
      ),
    );
  }

}