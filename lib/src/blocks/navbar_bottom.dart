import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget bottomNavbar(BuildContext context){
  return Container(
    height: 70,
    color: const Color.fromRGBO(31, 36, 72, 10),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
        color: Color.fromRGBO(40, 43, 75, 10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){
            context.go('/News');
          }, icon: const ImageIcon(AssetImage('image/news.png'),color: Colors.white, size: 35)),
          IconButton(onPressed: (){
            context.go('/Find');
          }, icon: const ImageIcon(AssetImage('image/find.png'),color: Colors.white , size: 35)),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 0, 204, 10),
                border: Border.all(
                  color: const Color.fromRGBO(255, 0, 204, 10),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: IconButton(onPressed: (){
              context.go('/Main');
            }, icon: const Icon(Icons.home, color: Colors.white, size:40)),
          ),
          IconButton(onPressed: (){
            context.go('/Group');
          }, icon: const ImageIcon(AssetImage('image/group.png'),color: Colors.white , size: 35)),
          IconButton(onPressed: (){
            context.go('/Settings');
          }, icon: const ImageIcon(AssetImage('image/settings.png'),color: Colors.white , size: 35))
        ],
      ),
    ),
  );
}