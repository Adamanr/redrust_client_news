import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:good_news/src/ui/Authentication/Registration/email_page.dart';
import 'package:flutter/material.dart';
import 'package:good_news/src/ui/Authentication/Authorization%20/auth_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class MainWindow extends StatefulWidget {
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
    await Directory('$path').create(recursive: true);
  }
}

class _MainWindow extends State<MainWindow>{
  @override
  Widget build(BuildContext context){
    getPermissions();
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
                      context.go('/Select');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(28, 28, 62, 10)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(35)
                                )
                            )
                        )
                    ),
                    child: const Text("Начать",
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
            )
        )
    );
  }
}

