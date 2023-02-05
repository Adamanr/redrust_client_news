import 'package:flutter/material.dart';
import 'package:good_news/src/models/Enitity/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';

Future getNews() async {
  String lentaRSS = 'https://lenta.ru/rss/news';
  String habrRSS = 'https://habr.com/ru/rss/flows/develop/all/?fl=ru';
  final lenta = await http.get(Uri.parse(lentaRSS));
  final habr = await http.get(Uri.parse(habrRSS));

  var decoded1 = RssFeed.parse(habr.body);
  var newsList = decoded1.items!.map((item) => NewsModel(
      body: item.content!.value.toString(),
      title: '${item.title}\n',
      description: checkAndTruncateString(item.description!),
      siteName: 'Habr',
      icons: const ImageIcon(AssetImage("image/habrLogo.png"),size: 50, color: Colors.blue),
  )).toList();

  var decoded2 = RssFeed.parse(lenta.body);
  newsList.addAll(decoded2.items!.map((item) => NewsModel(
    title: item.title!,
    body: item.content!.value.toString(),
    description: checkAndTruncateString(item.description!),
      siteName: 'Lenta',
      icons: const ImageIcon(AssetImage("image/lenta_L.png"),size: 50, color: Colors.black),
  )).toList());

  return newsList;
}
String checkAndTruncateString(String? input) {
  RegExp exp = RegExp(r'<[^>]*>|&[^>]*;|Читать далее|\n');

  if (input != null){
    if(input.length <= 150) {
      return input.replaceAll(exp, '').replaceFirst('    ', '');
    } else {
      return "${input.substring(0,150).replaceAll(exp, '').replaceFirst('    ', '')}...";
    }
  }
  return "";
}