import 'package:flutter/material.dart';

class FotoDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/assets/Foto.jpg"), fit: BoxFit.cover),
      ),
    );
  }
}
