import 'package:flutter/material.dart';

class NewsModel {
  final String title;
  final String description;
  final String siteName;
  final ImageIcon? icons;
  final String? body;

  NewsModel({required this.title, required this.description, required this.siteName, required this.icons, required this.body});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] as String,
      description: json['description'] as String,
      siteName: json['siteName'] as String,
      icons:  json['icons'] as ImageIcon,
      body: json['body'] as String,
    );
  }
}

List<NewsModel> convertToPersonList(Iterable<dynamic> data) {
  return data.map((e) => NewsModel.fromJson(e)).toList();
}