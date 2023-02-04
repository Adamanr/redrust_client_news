import 'package:flutter/material.dart';

class NewsModel {
  final String? title;
  final String? description;
  final String? siteName;
  final ImageIcon? icons;

  NewsModel({required this.title, required this.description, required this.siteName, required this.icons});
}