import 'package:go_router/go_router.dart';
import 'package:good_news/src/blocks/navbar_bottom.dart';
import 'package:good_news/src/models/Enitity/NewsModel.dart';
import 'package:good_news/src/models/get_news_portals.dart';
import 'package:good_news/src/ui/MainWindows/select_portal.dart';
import 'package:good_news/src/blocks/navbar_block.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';

class NewListPage extends StatefulWidget {
  const NewListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewListWidget();
  }
}



class _NewListWidget extends State<NewListPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
        bottomNavigationBar: bottomNavbar(context),
        drawer: const NavBar(),
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
          child:Column(
          children: <Widget> [
            Expanded(
              child:Container(
                margin: const EdgeInsets.only(left: 15,right: 15),
                child: FutureBuilder(
                future: getNews(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    final List news = snap.data;
                    news.shuffle();
                    ImageIcon imgIcon = const ImageIcon(AssetImage("image/lenta_L.png"),size: 50, color: Colors.white);
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        final NewsModel item = news[i];
                        return InkWell(
                          onTap: (){
                            context.goNamed('onlyNews',params: {"title":item.title,'descriptions':item.description,'icons':item.icons.toString(), 'siteName':item.siteName});
                          },
                            child:Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(37, 41, 70, 10  ),
                                border: Border.all(
                                  color: const Color.fromRGBO(255, 0, 204, 10),
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(20))
                            ),
                          margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      color: Colors.white,
                                      child: item.icons,
                                    ),
                                    Expanded(child: Text(item.title.toString(), style: const TextStyle(fontSize: 14, fontFamily: 'cunia', color: Colors.white)))
                                  ],
                                ),
                                Text(item.description.toString(), style: const TextStyle(color: Colors.white)),
                              ],
                            )
                        )
                        );
                      },
                      itemCount: news.length,
                    );
                  } else if (snap.hasError) {
                    return Center(
                      child: Text(snap.error.toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Nunito'),),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
            )
          ],
        ),
      ),
      )
    );
  }
}


