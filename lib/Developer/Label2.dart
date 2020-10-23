import 'package:flutter/material.dart';

class Label2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Sobre",
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
              "Este aplicativo foi desenvolvido em Flutter pela Isabella Santos da Silva, o tema escolhido foi análise de jogos através de uma aplicação mobile, o nome do aplicativo é SUI GAMES, e tem como objetivo oferecer uma plataforma mobile para jogadores de diversas plataformas, unindo as comunidades e permitindo que o usuário análise diversos jogos.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
