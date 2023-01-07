import 'package:flutter/material.dart';
import 'package:GoodNews/src/ui/auth.dart';

class MainWindow extends StatefulWidget{
  const MainWindow({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainWindow();
  }
}

class _MainWindow extends State<MainWindow>{
  @override
  Widget build(BuildContext context){

    return Scaffold(
        body: Container(
        width: 400,
        height: 1300,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
        'image/logo3.jpg'),
          fit: BoxFit.cover,
          ),
        ),
          child: Column(
            children: [
              Container (
              margin: EdgeInsets.only(top: 160),
              child:const Text(
                  "GoodNews",
              style: TextStyle(
                fontSize: 55,
                fontFamily: 'Kunika',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
              ),
              Container(
                margin: EdgeInsets.only(top: 370),
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
                    color: Color.fromRGBO(124, 57, 87, 100),
                    fontSize: 25,
                    fontFamily: 'cunia',
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child:InkWell(
                  child: const Text('Регистрация',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'cunia',
                    color: Colors.white
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