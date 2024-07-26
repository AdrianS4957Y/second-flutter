import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_application_1/aliments.dart';
import 'package:flutter_application_1/globals.dart'; // Добавляем импорт для таймера

void main() {
  runApp(const StartPage());
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();

    // Запуск таймера на 5 секунд
    Timer(const Duration(seconds: 5), () {
      // Переход на виджет Aliments через 5 секунд
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Aliments()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colors["orange"],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 377 / 926,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png'),
                  const SizedBox(height: 8),
                  const Text(
                    'Food Delivery Services',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset("assets/loopr.png"),
                const SizedBox(height: 50)
              ],
            )
          ],
        ),
      ),
    );
  }
}
