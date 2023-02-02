import 'package:good_news/src/ui/Authentication//Authorization%20/auth_controller.dart';
import 'package:good_news/src/ui/Authentication/Registration/register_controller.dart';
import 'package:good_news/src/ui/Authentication/select_page.dart';
import 'package:good_news/src/ui/MainWindows/home_page.dart';
import 'package:good_news/src/ui/Authentication/Registration/email_page.dart';
import "package:flutter/material.dart";
import 'package:good_news/src/ui/MainWindows/news_list_page.dart';
import 'package:good_news/src/ui/MainWindows/profile_page.dart';
import 'package:good_news/src/ui/main_page.dart';
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
      builder: (context, state) => const MainWindow()),
    GoRoute(
      path: '/Auth',
      builder: (context, state) => AuthController(controller: null)),
    GoRoute(
      path: '/Reg',
      builder: (context, state) =>  const RegistrationController(controller: null)),
    GoRoute(
      path: '/News',
      builder: (context, state) => const NewListPage()),
    GoRoute(
        path: '/Profile',
        builder: (context, state) => const ProfilePage()),
    GoRoute(
        path: '/Home',
        builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/Select',
      builder: (context, state) => const SelectPage())
  ]
);