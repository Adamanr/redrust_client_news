import 'dart:io';

import 'package:GoodNews/src/ui/Registration/EmailPage.dart';
import 'package:flutter/material.dart';
import 'package:GoodNews/src/ui/Authentification/authPage.dart';
import 'package:flutter/scheduler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';




void getDB() async{
  WidgetsFlutterBinding.ensureInitialized();

  Directory? appDocDir = await getExternalStorageDirectory();
  String? path = appDocDir?.path;

  openDatabase(
      join(path!, 'session.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE user(email TEXT PRIMARY KEY, username text, password text, image text)',
        );
      },

      version: 1,
  );

}

class MainWindow extends StatefulWidget{
  const MainWindow({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainWindow();
  }
}



Future<bool> _checkAndRequestPermissions() async {
  var result = await Permission.storage.request();
  return result == PermissionStatus.granted;
}

void getPermissions() async{
  bool hasPermission = await _checkAndRequestPermissions();
  if (hasPermission) {
    Directory? appDocDir = await getExternalStorageDirectory();
    String? path = appDocDir?.path;
    Directory dir = await Directory('$path').create(recursive: true);
    print(dir.path);
  } else {
    print(hasPermission);
  }

}

class _MainWindow extends State<MainWindow>{

  @override
  Widget build(BuildContext context){
    final PageController controller = PageController();
    return PageView(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
        children: <Widget>[
          _mainPage(controller),
          const AuthPage(controller: null,),
          EmailPage(controller: controller)
        ],
      );
  }
}

Widget _mainPage(PageController controller) {
  getPermissions();
  getDB();
  return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                radius: 1.9,
                center: Alignment.topLeft,
                colors: [
                  Color.fromRGBO(26, 24, 74, 10),
                  Color.fromRGBO(21, 22, 42, 10),
                  Color.fromRGBO(73, 43, 69, 10)
                ],
                stops: [0.2, 0.7, 2.7]
            ),
          ),
          width: 400,
          height: 1300,
          child: Center(child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100, left: 100, bottom: 100),
                alignment: Alignment.center,
                width: 250,
                child: Transform(
                  transform: Matrix4.rotationZ(0.4),
                  child: Image.asset("image/logoNews.png"),
                ),
              ),
              RichText(
                  textDirection: TextDirection.ltr,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 50, fontFamily: 'Cunia'),
                    children: <TextSpan>[
                      TextSpan(text: "Good",
                          style: TextStyle(
                              color: Color.fromRGBO(243, 118, 130, 10))),
                      TextSpan(text: "News",
                          style: TextStyle(
                              color: Color.fromRGBO(243, 184, 148, 10))),
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.only(top: 80),
                width: 292,
                height: 67,
                child: ElevatedButton(
                  onPressed: (){
                    controller.animateToPage(2, duration: const Duration(seconds: 1), curve: Curves.decelerate);
                    ///controller.jumpToPage(1);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(28, 28, 62, 10)),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(35))
                          )
                      )
                  ),
                  child: const Text("Авторизация",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ))
  );
}