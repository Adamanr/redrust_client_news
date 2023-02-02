import 'package:flutter/material.dart';
import 'package:good_news/src/ui/Authentication/Authorization%20/code_page.dart';
import 'package:good_news/src/ui/Authentication/Authorization%20/email_password_page.dart';

class AuthController extends StatefulWidget{
  PageController? controller;
  AuthController({super.key, required this.controller});

  @override
  State<AuthController> createState() {
    return _AuthWidget();
  }
}

class _AuthWidget extends State<AuthController>{
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: <Widget>[
        EmailPasswordPage(controller: controller),
        CodePage(controller: controller)
      ],
    );
  }
}