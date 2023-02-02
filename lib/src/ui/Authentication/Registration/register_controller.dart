import 'package:flutter/material.dart';
import 'package:good_news/src/ui/Authentication/Registration/avatar_page.dart';
import 'package:good_news/src/ui/Authentication/Registration/email_page.dart';
import 'package:good_news/src/ui/Authentication/Registration/password_page.dart';

class RegistrationController extends StatefulWidget {
  const RegistrationController({super.key, required controller});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationWidget();
  }
}

class _RegistrationWidget extends State<RegistrationController>{
  @override
  Widget build(BuildContext context){
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: <Widget>[
        EmailPage(controller: controller),
        PasswordPage(controller: controller),
        AvatarPage(controller: controller)
      ],
    );
  }
}