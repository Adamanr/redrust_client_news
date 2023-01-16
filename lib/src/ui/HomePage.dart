
import 'package:GoodNews/src/ui/SelectPortal.dart';
import 'package:GoodNews/src/blocks/Navbar.dart';
import 'package:GoodNews/src/models/reg_request.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:webfeed/webfeed.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidget();
  }
}

class _HomeWidget extends State<HomePage> {

  Future<List<User>> dogs() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'user.db'),
    );

    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }


  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
        appBar: AppBar(
          title: Text("Новости"),
        ),
        drawer: NavBar(),
        body: Column(
          children: [
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(

                onPressed: ()=> {
                  Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) => SelectPortal())
                  ),
                },
                child: const Text("Выберите новостной портал",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'cunia'
                ),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(242, 52, 65, 100)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))
                        )
                    )
                ),
              ),
            ),
          ListView.builder(
            itemCount: _feed.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_feed[index].title),
                subtitle: Text(_feed[index].description),
              );
            },
          )
          ],
        ),
      ),
    );
  }
}

Future<List<RssItem>> loadFeed() async {
  var rssString = await http.get('https://feeds.feedburner.com/dartlang-news');
  var rssFeed = RssFeed.parse(rssString.body);
  return rssFeed.items;
}

