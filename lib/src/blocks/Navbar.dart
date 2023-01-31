import 'dart:io';

import 'package:GoodNews/src/ui/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:GoodNews/src/ui/HomePage.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:go_router/go_router.dart';

Future<Database> getDB() async{

  Directory? appDocDir = await getExternalStorageDirectory();
  String? path = appDocDir?.path;

  return openDatabase(
    join(path!, 'session.db'),
    version: 1,
  );
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Drawer(
      child:ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('A'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://sun9-8.userapi.com/impg/WfXjVs4Ut_kxXQDdPFZkLMrbpmyPp8wk2HvVpg/ZyJg3jvTuTA.jpg?size=735x720&quality=95&sign=9b562c4f77a3ebbc299b6abad7d1155f&type=album',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("image/logo3.jpg")
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard_sharp),
            title: Text('Новости'),
            onTap: () => context.go('/Home')
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Авторы'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Группы'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.perm_identity),
            title: Text('Профиль'),
            onTap: () => Navigator.pushReplacement(
                context,MaterialPageRoute(builder: (context) => profile())
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings_accessibility_rounded),
            title: Text('Агрегатор'),
            onTap: ()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('О приложении'),
            onTap: () => {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Выйти'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => context.go('/')
          ),
        ],
      ),
    );
  }
}