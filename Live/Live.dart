import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sui_games/Live/ButtonNewLive.dart';
import 'package:sui_games/models/lives.dart';

final _pageController = PageController();

class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  var db = FirebaseFirestore.instance;
  List<Lives> lives = List();

  //Ouvir todos os eventos que ocorrem na coleção
  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    //Quando ocorrer um "evento" na coleção, recuperar todos
    //os documentos
    listen?.cancel();
    listen = db.collection("lives").snapshots().listen((res) {
      //converter todos os documentos em objetos
      setState(() {
        lives = res.docs.map((e) => Lives.fromMap(e.data(), e.id)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Lives Ao Vivo"),
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
              // Center(
              //  child: Text(
              //   "No momento não há Lives ativas, verifique novamente em alguns minutos!",
              //  textAlign: TextAlign.center,
              // ),
              // ),
              StreamBuilder<QuerySnapshot>(
                  stream: db.collection("lives").snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(child: Text('Erro de conexao'));
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        return ListView.builder(
                          itemCount: lives.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(lives[index].nome,
                                  style: TextStyle(fontSize: 24)),
                              subtitle: Text(lives[index].data,
                                  style: TextStyle(fontSize: 16)),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  db
                                      .collection("lives")
                                      .doc(lives[index].id)
                                      .delete();
                                },
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/novalive',
                                    arguments: lives[index].id);
                              },
                            );
                          },
                        );
                    }
                  }),

              ButtonNovaLive(),
            ],
          ),
        ),
      ],
    );
  }
}
