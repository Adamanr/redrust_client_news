import 'package:GoodNews/src/NewsIcon.dart';
import 'package:GoodNews/src/blocks/Navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';


var prefs = SharedPreferences.getInstance();

class SelectPortal extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _SelectPortalWidget();
  }
}

class _SelectPortalWidget extends State<SelectPortal>{
  var habrColor = Color.fromRGBO(217,222,226, 10);
  var habrTextColor = Color.fromRGBO(170,189,204, 10);
  var habrLogoColor = Color.fromRGBO(170,189,204, 10);
  var habrStatus = false;


  var lentaColor = Color.fromRGBO(217,222,226, 10);
  var lentaTextColor = Color.fromRGBO(170,189,204, 10);
  var lentaLogoColor = Color.fromRGBO(170,189,204, 10);
  var lentaStatus = false;

  var _containerColor = Colors.blue;
  bool status = false;
  var statusColor = Color.fromRGBO(217,222,226, 10);

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
      appBar: AppBar(
      title: Text("Выбор портала"),
      ),
      drawer: NavBar(),
        body: ListView(
          padding: const EdgeInsets.all(5),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 7, top: 11),
              height: 60,
              decoration: BoxDecoration(
                  color: habrColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(left:10,right: 10),
                      child: ImageIcon(AssetImage("image/habrLogo.png"),
                          size: 45,
                          color: habrLogoColor),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Хабр",
                      style: TextStyle(
                          fontSize: 30,
                          color: habrTextColor,
                          fontFamily: 'MultiroundPro'
                      ),
                    ),
                  ),

                  Switch(
                    onChanged: (value) {
                      setState(() {
                        habrStatus = value;
                        if (habrStatus){
                          habrColor = Colors.blue;
                          habrLogoColor = Colors.white;
                          habrTextColor = Colors.white;
                        }else{
                          habrColor = Color.fromRGBO(217,222,226, 10);
                          habrLogoColor = Color.fromRGBO(170,189,204, 10);
                          habrTextColor = Color.fromRGBO(170,189,204, 10);
                        }
                      });
                    },
                    value: habrStatus,
                    activeColor: Colors.blue,
                    activeTrackColor: Color.fromRGBO(140,199,243,10),
                    inactiveThumbColor: Color.fromRGBO(217,222,226, 10),
                    inactiveTrackColor: Color.fromRGBO(169,188,203,10),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 7),
              height: 60,
              decoration: BoxDecoration(
                  color: lentaColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left:10,right: 10),
                      child: ImageIcon(AssetImage("image/lenta.png"),
                      size: 100,
                          color: lentaLogoColor),
                  ), // icon
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Лента ру",
                      style: TextStyle(
                          fontSize: 23.52,
                          color: lentaTextColor,
                          fontFamily: 'MultiroundPro',
                      ),
                    ),
                  ),

                  Switch(
                    onChanged: (value) {
                      setState(() {
                        lentaStatus = value;
                        if (lentaStatus){
                          lentaColor = Colors.black;
                          lentaLogoColor = Colors.white;
                          lentaTextColor = Colors.white;
                        }else{
                          lentaColor = Color.fromRGBO(217,222,226, 10);
                          lentaLogoColor = Color.fromRGBO(170,189,204, 10);
                          lentaTextColor = Color.fromRGBO(170,189,204, 10);
                        }
                      });
                    },
                    value: lentaStatus,
                    activeColor: Colors.blue,
                    activeTrackColor: Color.fromRGBO(140,199,243,10),
                    inactiveThumbColor: Color.fromRGBO(217,222,226, 10),
                    inactiveTrackColor: Color.fromRGBO(169,188,203,10),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 7),
              height: 60,
              decoration: BoxDecoration(
                  color: statusColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(left:10,right: 10),
                      child: const Icon(Icons.call,size: 35,color: Colors.white,)
                  ), // icon
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Лента ру",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'MultiroundPro'
                      ),
                    ),
                  ),

                  Switch(
                    onChanged: (value) {
                      setState(() {
                        status = value;
                        if (status){
                          statusColor = Color.fromRGBO(208,227,242, 10);
                        }else{
                          statusColor = Color.fromRGBO(217,222,226, 10);
                        }
                      });
                    },
                    value: status,
                    activeColor: Colors.blue,
                    activeTrackColor: Color.fromRGBO(140,199,243,10),
                    inactiveThumbColor: Color.fromRGBO(217,222,226, 10),
                    inactiveTrackColor: Color.fromRGBO(169,188,203,10),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}