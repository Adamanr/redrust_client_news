import "package:flutter/material.dart";
import 'package:GoodNews/src/ui/HomePage.dart';
import 'package:GoodNews/src/ui/MainWindow.dart';
import 'ui/Authentification/authPage.dart';
import 'ui/reg.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/reg": (context) => Reg(),
        "/auth" : (context) => Auth(),
      },
      home: MainWindow(),
    );
  }
}