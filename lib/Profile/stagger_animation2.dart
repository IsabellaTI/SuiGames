import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sui_games/Home/Card.dart';
import 'package:sui_games/Home/Card2.dart';
import 'package:sui_games/Profile/Titulo.dart';
import 'package:sui_games/Profile/Titulo2.dart';
import 'package:sui_games/Profile/fade_container.dart';
import 'package:sui_games/Profile/hometop.dart';

class StaggerAnimation2 extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation2({@required this.controller})
      : containerGrow = CurvedAnimation(parent: controller, curve: Curves.ease),
        ListSlidePosition = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 0),
                end: EdgeInsets.only(bottom: 80))
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.325, 0.8, curve: Curves.ease))),
        fadeAnimation = ColorTween(
                begin: Color.fromRGBO(0, 250, 154, 1),
                end: Color.fromRGBO(0, 250, 154, 0.0))
            .animate(
                CurvedAnimation(parent: controller, curve: Curves.decelerate));

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> ListSlidePosition;
  final Animation<Color> fadeAnimation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            HomeTop(
              containerGrow: containerGrow,
            ),
            //AnimatedListView(
            // ListSlidePosition: ListSlidePosition,
            // ),
            Titulo(),
            AppBarTransparent(),
            Titulo2(),
            Card2(),
          ],
        ),
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(animation: controller, builder: _buildAnimation),
      ),
    );
  }
}
