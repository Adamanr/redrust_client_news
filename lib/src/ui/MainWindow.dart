import 'dart:io';

import 'package:flutter/material.dart';
import 'package:GoodNews/src/ui/auth.dart';
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
  getPermissions();
  getDB();
    return Scaffold(
        body: Container(
        color: Colors.white,
        width: 400,
        height: 1300,
          child: Column(
            children: [
              Container (
              margin: EdgeInsets.only(top: 120),
              child:const Text(
                  "GoodNews",
              style: TextStyle(
                fontSize: 55,
                fontFamily: 'Kunika',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
              ),
              Image.asset("image/back.jpg"),
              Container(
                margin: const EdgeInsets.only(top: 80),
                width: 260,
                height: 55,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/auth");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    )
                  ),
                  child: const Text("Авторизация",
                  style: TextStyle(
                    color: Color.fromRGBO(247, 109, 109, 1),
                    fontSize: 25,
                    fontFamily: 'cunia',
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child:InkWell(
                  child: const Text('Регистрация',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'cunia',
                    color: Color.fromRGBO(36, 49, 94,1),
                  ),),
                  onTap: () => Navigator.pushNamed(context, "/reg")
              )
              )
            ],
          ),
      )
    );
  }
}
