import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sui_games/Search/ButtonNovoJogo.dart';
import 'package:sui_games/models/jogos.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var db = FirebaseFirestore.instance;
  List<Jogos> jogos = List();

  //Ouvir todos os eventos que ocorrem na coleção
  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    //Quando ocorrer um "evento" na coleção, recuperar todos
    //os documentos
    listen?.cancel();
    listen = db.collection("jogos").snapshots().listen((res) {
      //converter todos os documentos em objetos
      setState(() {
        jogos = res.docs.map((e) => Jogos.fromMap(e.data(), e.id)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Jogos"),
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
              StreamBuilder<QuerySnapshot>(
                  stream: db.collection("jogos").snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(child: Text('Erro de conexão.'));
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        return ListView.builder(
                            itemCount: jogos.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(jogos[index].nome,
                                    style: TextStyle(fontSize: 24)),
                                subtitle: Text(jogos[index].genero,
                                    style: TextStyle(fontSize: 16)),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    //Apagar um documento
                                    db
                                        .collection("jogos")
                                        .doc(jogos[index].id)
                                        .delete();
                                  },
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, '/cadastroJogos',
                                      arguments: jogos[index].id);
                                },
                              );
                            });
                    }
                  }),
              ButtonNovoJogo(),
            ],
          ),
        ),
      ],
    );
  }
}
