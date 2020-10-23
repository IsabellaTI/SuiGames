import 'package:flutter/material.dart';
import 'package:sui_games/Jogo/showAlertDialogSupportJogo.dart';

class ButtonJogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.blue],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
            ),
          ),
          child: FlatButton(
            child: Text(
              'Avaliar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.3),
            ),
            onPressed: () {
              showAlertDialogSupportJogo(context);
            },
          ),
        ),
      ],
    ));
  }
}
