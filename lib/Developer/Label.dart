import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/assets/Banner2.jpeg"), fit: BoxFit.cover),
      ),
    );
  }
}
