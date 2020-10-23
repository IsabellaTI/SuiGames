import 'package:flutter/material.dart';

class Graficos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/assets/Grafico.jpg"), fit: BoxFit.cover),
      ),
    );
  }
}
