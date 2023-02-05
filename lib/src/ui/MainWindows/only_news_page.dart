import 'package:flutter/material.dart';
import 'package:good_news/src/models/Enitity/NewsModel.dart';

class OnlyNewsPage extends StatefulWidget {
  String? title;
  String? descriptions;
  String? siteName;
  String? body;
  String? icons;
  OnlyNewsPage({super.key, required this.title, required this.descriptions, required this.icons, required this.siteName, required this.body});


  @override
  State<StatefulWidget> createState() {
    return OnlyNewsWidget();
  }
}

class OnlyNewsWidget extends State<OnlyNewsPage>{
  late String content;
  @override
  Widget build(BuildContext context) {
    if(widget.body != null){
      content = widget.body!;
    }else{
      content = "Пусто";
    }
    return Scaffold(
      body: Column(
        children: [
          Text(content),
        ],
      ),
    );
  }

}