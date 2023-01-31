import 'package:GoodNews/src/ui/Authentification/authPage.dart';
import 'package:GoodNews/src/ui/HomePage.dart';
import 'package:GoodNews/src/ui/Registration/EmailPage.dart';
import "package:flutter/material.dart";
import 'package:GoodNews/src/ui/MainWindow.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _route,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}

GoRouter _route = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainWindow()
    ),
    GoRoute(
      path: '/Auth',
      builder: (context, state) => const AuthPage(controller: null,)
    ),
    GoRoute(
      path: '/Reg',
      builder: (context, state) =>  const EmailPage(controller: null,)
    ),
    GoRoute(
      path: '/Home',
      builder: (context, state) => const HomePage()
    )
  ]
);