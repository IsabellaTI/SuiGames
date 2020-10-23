import 'package:flutter/material.dart';
import 'package:sui_games/Developer/FotoDev.dart';
import 'package:sui_games/Developer/Label.dart';
import 'package:sui_games/Developer/Label2.dart';

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Label(),
            Label2(),
            FotoDev(),
          ],
        ),
      ],
    );
  }
}
