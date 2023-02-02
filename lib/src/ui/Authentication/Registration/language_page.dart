import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() {
    return _LanguageWidget();
  }
}

class _LanguageWidget extends State<LanguagePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children:  [
          const Padding(
              padding: EdgeInsets.only(),
              child: Text("")),
          ElevatedButton(onPressed: (){}, child: const Text(""))
        ],
      ),
    );
  }
}