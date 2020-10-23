import 'package:flutter/material.dart';
import 'package:sui_games/Players/ListData.dart';

class Players extends StatelessWidget {
  final String titulo;

  Players({Key key, this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jogadores"),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListData(
                title: "Jogador 1",
                subtitle: "Descrição",
                image: AssetImage("lib/assets/Logo1.jpeg"),
              ),
              ListData(
                title: "Jogador 2",
                subtitle: "Descrição",
                image: AssetImage("lib/assets/Logo2.jpeg"),
              ),
              ListData(
                title: "Jogador 3",
                subtitle: "Descrição",
                image: AssetImage("lib/assets/Logo3.jpeg"),
              ),
              ListData(
                title: "Jogador 4",
                subtitle: "Descrição",
                image: AssetImage("lib/assets/Logo4.jpeg"),
              ),
              ListData(
                title: "Jogador 5",
                subtitle: "Descrição",
                image: AssetImage("lib/assets/Logo5.jpeg"),
              ),
            ],
          ),
        ));
  }
}
