
import 'package:good_news/src/models/Enitity/NewsModel.dart';
import 'package:good_news/src/ui/Authentication//Authorization%20/auth_controller.dart';
import 'package:good_news/src/ui/Authentication/Registration/register_controller.dart';
import 'package:good_news/src/ui/Authentication/select_page.dart';
import 'package:good_news/src/ui/MainWindows/find_page.dart';
import 'package:good_news/src/ui/MainWindows/group_page.dart';
import 'package:good_news/src/ui/MainWindows/home_page.dart';
import "package:flutter/material.dart";
import 'package:good_news/src/ui/MainWindows/news_list_page.dart';
import 'package:good_news/src/ui/MainWindows/only_news_page.dart';
import 'package:good_news/src/ui/MainWindows/profile_page.dart';
import 'package:good_news/src/ui/MainWindows/settings_page.dart';
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
        path: '/Profile',
        builder: (context, state) => const ProfilePage()),
    GoRoute(
      path: '/Select',
      builder: (context, state) => const SelectPage()),
    GoRoute(
        path: '/Notification',
        builder: (context, state) => HomePage()),
    GoRoute(
      name:'onlyNews',
        path: '/onlyNews/:title/:descriptions/:icons/:siteName',
        builder: (context, state) => OnlyNewsPage(
            title: state.params['title'], descriptions: state.params['descriptions'], icons: state.params['icons'], siteName: state.params['siteName'],body: state.params['body']
        )),


    GoRoute(
        path: '/News',
        builder: (context, state) =>  const NewListPage()),
    GoRoute(
        path: '/Find',
        builder: (context, state) => FindPage()),
    GoRoute(
        path: '/Main',
        builder: (context, state) => HomePage()),
    GoRoute(
        path: '/Settings',
        builder: (context, state) => const SettingsPage()),
    GoRoute(
        path: '/Group',
        builder: (context, state) => GroupPage()),


  ]
);