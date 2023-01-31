import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget{
  final PageController? controller;
  const EmailPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EmailWidget();
  }
}

class _EmailWidget extends State<EmailPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
          child:Column(
          children: [
            ElevatedButton(onPressed: (){
              widget.controller?.animateToPage(1, duration: Duration(seconds: 2), curve: Curves.easeInSine);
            }, child: Text('Перейти')
            )
          ],
        )
      ),
    );
  }
}