import 'package:GoodNews/src/ui/SelectPortal.dart';
import 'package:GoodNews/src/blocks/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/util/iterable.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeWidget();
  }
}

class NewsModel {
  final String? title;
  final String? description;
  final String? siteName;

  NewsModel({required this.title, required this.description, required this.siteName});
}

class _HomeWidget extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
        appBar: AppBar(
          title: const Text("Новости"),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add', // used by assistive technologies
          onPressed: () async {
            String lentaRSS = 'https://lenta.ru/rss/news';
            String habrRSS = 'https://habr.com/ru/rss/flows/develop/all/?fl=ru';
            RssFeed decode;
            final lenta = await http.get(Uri.parse(lentaRSS));
            final habr = await http.get(Uri.parse(habrRSS));
            RegExp exp = RegExp(r'<[^>]*>|&[^>]*;|Читать далее');

            var decoded1 = RssFeed.parse(habr.body);
            var habrDecoded = decoded1.items!.map((item) => NewsModel(
                title: item.title,
                description: item.description?.replaceAll(exp, ''),
                siteName: 'Habr'
            )).toList();

            var decoded2 = RssFeed.parse(lenta.body);
            habrDecoded.addAll(decoded2.items!.map((item) => NewsModel(
                title: item.title,
                description: item.description?.replaceAll(exp, ''),
                siteName: 'Lenta'
            )).toList());
          },
          child: Icon(Icons.add),
        ),
        drawer: NavBar(),
        body: Column(
          children: <Widget> [
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=> {
                  Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) => SelectPortal())
                  ),
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(242, 52, 65, 100)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))
                        )
                    )
                ),
                child: const Text("Выберите новостной портал",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'cunia'
                )),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchNews(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    final List _news = snap.data;
                    _news.shuffle();
                    ImageIcon imgIcon = ImageIcon(AssetImage("image/lenta_L.png"),size: 50, color: Colors.black);
                    return ListView.builder(
                      scrollDirection: Axis.vertical,

                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        String textPortal = '';
                        String descPortal = '';
                        final NewsModel _item = _news[i];
                        switch (_item.siteName) {
                          case 'Habr':
                            textPortal = '${_item.title}\n';
                            descPortal = '${_item.description?.replaceFirst('    ', '')}\n';
                            imgIcon = ImageIcon(AssetImage("image/habrLogo.png"),size: 50, color: Colors.blue);
                            break;
                          case 'Lenta':
                            textPortal = '${_item.title}';
                            descPortal = '${_item.description?.replaceFirst('    ', '')}';
                            imgIcon = ImageIcon(AssetImage("image/lenta_L.png"),size: 50, color: Colors.black);
                            break;
                        }
                        return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: imgIcon,
                                ),
                               Expanded(child: Text(textPortal, style: TextStyle(fontSize: 14, fontFamily: 'cunia')))
                              ],
                            ),
                            Text(descPortal),
                            Container(
                              width: 100,
                              height: 2,
                              color: Colors.black,
                            )
                          ],
                          // title:
                          // subtitle: Text(
                          //   '${_item.description}',
                          //   maxLines: 4,
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                          )
                        );
                      },
                      itemCount: _news.length,
                    );
                  } else if (snap.hasError) {
                    return Center(
                      child: Text(snap.error.toString()),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
            // Expanded(child: ListView.builder(
            //   physics: const AlwaysScrollableScrollPhysics(),
            //
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   itemCount: myArray.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //         height: 40,
            //         child: Text(myArray[index], style: TextStyle(fontSize: 25),)
            //       );
            //     },
            //   )
            // )
          ],
        ),
      ),
    );
  }
}


Future fetchNews() async {
  String lentaRSS = 'https://lenta.ru/rss/news';
  String habrRSS = 'https://habr.com/ru/rss/flows/develop/all/?fl=ru';
  RssFeed decode;
  final lenta = await http.get(Uri.parse(lentaRSS));
  final habr = await http.get(Uri.parse(habrRSS));
  RegExp exp = RegExp(r'<[^>]*>|&[^>]*;|Читать далее');

  var decoded1 = RssFeed.parse(habr.body);
  var habrDecoded = decoded1.items!.map((item) => NewsModel(
    title: item.title,
    description: item.description?.replaceAll(exp, ''),
    siteName: 'Habr'
  )).toList();
  
  var decoded2 = RssFeed.parse(lenta.body);
  habrDecoded.addAll(decoded2.items!.map((item) => NewsModel(
    title: item.title,
    description: item.description?.replaceAll(exp, ''),
    siteName: 'Lenta'
  )).toList());
  return habrDecoded;
}