import 'package:flutter/material.dart';
import 'package:sui_games/Home/ButtonTelaJogo.dart';
import 'package:sui_games/Home/Card.dart';
import 'package:sui_games/Home/Card2.dart';
import 'package:sui_games/Home/Espaco.dart';
import 'package:sui_games/Home/GradientAppBar.dart';
import 'package:sui_games/Home/TituloHome.dart';
import 'package:sui_games/Home/TituloHome2.dart';
import 'package:sui_games/items/Custom_Drawer.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Widget _buildBodyBack() => Container(
    //   decoration: BoxDecoration(
    //  image: DecorationImage(
    //   image: AssetImage("lib/assets/Fundo_2.jpeg"),
    //  fit: BoxFit.cover,
    //   ),
    //  ),
    // );
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar("Novidades"),
          Espaco(),
          TituloHome(),
          AppBarTransparent(),
          TituloHome2(),
          Card2(),
          ButtonTelaJogo(),
        ],
      ),
    );
  }
}
