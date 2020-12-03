import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NovoPlayer extends StatefulWidget {
  @override
  _NovoPlayerState createState() => _NovoPlayerState();
}

class _NovoPlayerState extends State<NovoPlayer> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  var db = FirebaseFirestore.instance;

  //Recuperar um DOCUMENTO a partir do ID
  void getDocumentById(String id) async {
    await db.collection("usuarios").doc(id).get().then((res) {
      txtEmail.text = res.data()['email'];
      txtSenha.text = res.data()['senha'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;

    if (id != null) {
      if (txtEmail.text == '' && txtSenha.text == '') {
        getDocumentById(id);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Jogador"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Column(children: [
            //CAMPO NOME
            TextField(
              controller: txtEmail,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "E-mail",
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //CAMPO PREÇO
            TextField(
              controller: txtSenha,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Senha",
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
                    child: Text("Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    onPressed: () async {
                      if (id == null) {
                        // INSERIR um novo documento na colecao
                        await db.collection("usuarios").add({
                          "email": txtEmail.text,
                          "senha": txtSenha.text,
                        });
                      } else {
                        // ATUALIZAR os dados do documento
                        await db.collection("usuarios").doc(id).update({
                          "email": txtEmail.text,
                          "senha": txtSenha.text,
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
