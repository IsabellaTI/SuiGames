import 'package:flutter/material.dart';
import 'package:sui_games/Support/showAlertDialogSupport.dart';
import 'package:sui_games/Support/showAlertDialogSupport2.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Olá!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Está é área de suporte, você pode enviar uma sugestão ou pedir ajuda!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
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
                'Sugestão',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3),
              ),
              onPressed: () {
                showAlertDialogSupport(context);
              },
            ),
          ),
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
                'Ajuda',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3),
              ),
              onPressed: () {
                showAlertDialogSupport2(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
