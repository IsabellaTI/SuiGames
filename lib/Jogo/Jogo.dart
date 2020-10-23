import 'package:flutter/material.dart';
import 'package:sui_games/Jogo/Banner.dart';
import 'package:sui_games/Jogo/ButtonJogo.dart';
import 'package:sui_games/Jogo/Graficos.dart';
import 'package:sui_games/Jogo/LabelJogo.dart';

class Jogo extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(controller: _pageController, children: <Widget>[
      Scaffold(
          appBar: AppBar(
            title: Text("Jogo: League of Legends"),
            centerTitle: true,
          ),
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/Fundo.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  BannerJogo(),
                  LabelJogo(),
                  Graficos(),
                  ButtonJogo(),
                ],
              ),
            ],
          ))
    ]);
  }
}
