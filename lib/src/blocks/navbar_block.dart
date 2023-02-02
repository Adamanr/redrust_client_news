import 'package:good_news/src/ui/MainWindows/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      child:ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Oflutter.com'),
            accountEmail: const Text('A'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://sun9-8.userapi.com/impg/WfXjVs4Ut_kxXQDdPFZkLMrbpmyPp8wk2HvVpg/ZyJg3jvTuTA.jpg?size=735x720&quality=95&sign=9b562c4f77a3ebbc299b6abad7d1155f&type=album',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("image/logo3.jpg")
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_sharp),
            title: const Text('Новости'),
            onTap: () => context.go('/Home')
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Авторы'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Группы'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.perm_identity),
            title: const Text('Профиль'),
            onTap: () => Navigator.pushReplacement(
                context,MaterialPageRoute(builder: (context) => const ProfilePage())
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_accessibility_rounded),
            title: const Text('Агрегатор'),
            onTap: ()=> {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Настройки'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('О приложении'),
            onTap: () => {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Выйти'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => context.go('/')
          ),
        ],
      ),
    );
  }
}