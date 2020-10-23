import 'package:flutter/material.dart';
import 'package:sui_games/Start/Start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sui_Games',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Color.fromARGB(255, 4, 100, 141),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Start(),
    );
  }
}
