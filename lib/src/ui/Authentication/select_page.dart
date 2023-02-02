import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() {
    return SelectWidget();
  }
}

class SelectWidget extends State<SelectPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 22, 50, 10),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20,top: 80, bottom: 30),
              child: const Text("С другой стороны, высокое качество позиционных исследований однозначно фиксирует необходимость глубокомысленных рассуждений. Мы вынуждены отталкиваться от того, что консультация с широким активом требует от нас анализа первоочередных требований. А также некоторые особенности внутренней политики, вне зависимости от их уровня, должны быть подвергнуты целой серии независимых исследований.",
                style: TextStyle(fontSize: 20, color:Colors.white),
              textAlign: TextAlign.justify),
              ),
            SizedBox(
              width: 320,
              height:67,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/Auth');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(34, 34, 87, 1)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))
                ))),
                child: const Text("Войти",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                )))),
            Container(
              width: 320,
              height:67,
              margin: const EdgeInsets.only(top:10),
              child: ElevatedButton(
                onPressed: () {
                   context.go('/Reg');
                  },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        )
                    )
                ),
                child: const Text("Регистрация",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}