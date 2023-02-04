import 'package:flutter/material.dart';
import 'package:good_news/src/blocks/navbar_bottom.dart';

class FindPage extends StatefulWidget {
  FindPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FindWidget();
  }
}

class _FindWidget extends State<FindPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavbar(context),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}