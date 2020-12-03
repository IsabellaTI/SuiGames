import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sui_games/Players/ButtonNovoPlayer.dart';
import 'package:sui_games/models/usuarios.dart';

class Players extends StatefulWidget {
  //final String titulo;

  //Players({Key key, this.titulo}) : super(key: key);

  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  var db = FirebaseFirestore.instance;
  List<Usuario> usuarios = List();

  //Ouvir todos os eventos que ocorrem na coleção
  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    //Quando ocorrer um "evento" na coleção, recuperar todos
    //os documentos
    listen?.cancel();
    listen = db.collection("usuarios").snapshots().listen((res) {
      //converter todos os documentos em objetos
      setState(() {
        usuarios =
            res.docs.map((e) => Usuario.fromMap(e.data(), e.id)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Jogadores"),
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
                  stream: db.collection("usuarios").snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(child: Text('Erro de conexão.'));
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        return ListView.builder(
                          itemCount: usuarios.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(usuarios[index].email,
                                  style: TextStyle(fontSize: 24)),
                              subtitle: Text(usuarios[index].senha,
                                  style: TextStyle(fontSize: 16)),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  //Apagar um documento
                                  db
                                      .collection("usuarios")
                                      .doc(usuarios[index].id)
                                      .delete();
                                },
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/cadastrojogador',
                                    arguments: usuarios[index].id);
                              },
                            );
                          },
                        );
                    }
                  }),
              ButtonNovoPlayer(),
            ],
          ),
        ),
      ],
    );
  }
}

/*body: new SingleChildScrollView(
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
        )*/
