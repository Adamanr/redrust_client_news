import 'package:flutter/material.dart';
import 'package:good_news/src/blocks/navbar_bottom.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() {
    return _SettingsWidget();
  }
}

class _SettingsWidget extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavbar(context),
      body: Column(
        children: [

        ],
      ),
    );
  }

}