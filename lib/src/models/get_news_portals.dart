import 'package:flutter/material.dart';
import 'package:good_news/src/models/Enitity/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';

Future getNews() async {
  String lentaRSS = 'https://lenta.ru/rss/news';
  String habrRSS = 'https://habr.com/ru/rss/flows/develop/all/?fl=ru';
  final lenta = await http.get(Uri.parse(lentaRSS));
  final habr = await http.get(Uri.parse(habrRSS));
  RegExp exp = RegExp(r'<[^>]*>|&[^>]*;|Читать далее|\n');

  var decoded1 = RssFeed.parse(habr.body);
  var newsList = decoded1.items!.map((item) => NewsModel(
      title: '${item.title}\n',
      description: item.description?.replaceAll(exp, '').replaceFirst('    ', ''),
      siteName: 'Habr',
      icons: const ImageIcon(AssetImage("image/habrLogo.png"),size: 50, color: Colors.blue),
  )).toList();

  var decoded2 = RssFeed.parse(lenta.body);
  newsList.addAll(decoded2.items!.map((item) => NewsModel(
    title: item.title,
      description: item.description?.replaceAll(exp, '').replaceFirst('    ', ''),
      siteName: 'Lenta',
      icons: const ImageIcon(AssetImage("image/lenta_L.png"),size: 50, color: Colors.black),
  )).toList());

  return newsList;
}