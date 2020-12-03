import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NovaLive extends StatefulWidget {
  @override
  _NovaLiveState createState() => _NovaLiveState();
}

class _NovaLiveState extends State<NovaLive> {
  var txtNome = TextEditingController();
  var txtData = TextEditingController();

  var db = FirebaseFirestore.instance;

  //Recuperar um DOCUMENTO a partir do ID
  void getDocumentById(String id) async {
    await db.collection("lives").doc(id).get().then((res) {
      txtNome.text = res.data()['nome'];
      txtData.text = res.data()['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;

    if (id != null) {
      if (txtNome.text == '' && txtData.text == '') {
        getDocumentById(id);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Live"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Column(children: [
            //CAMPO NOME
            TextField(
              controller: txtNome,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Nome",
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //CAMPO PREÇO
            TextField(
              controller: txtData,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Data",
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //BOTÕES
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("Começar",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    onPressed: () async {
                      if (id == null) {
                        // INSERIR um novo documento na colecao
                        await db.collection("lives").add({
                          "nome": txtNome.text,
                          "data": txtData.text,
                        });
                      } else {
                        // ATUALIZAR os dados do documento
                        await db.collection("lives").doc(id).update({
                          "nome": txtNome.text,
                          "data": txtData.text,
                        });
                      }
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 100,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("Cancelar",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ])),
      backgroundColor: Colors.grey[200],
    );
  }
}
