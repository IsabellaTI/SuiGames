import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sui_games/Login/showAlertDialogESenha.dart';
import 'package:sui_games/Login/showAlertDialogLogin.dart';
import 'package:sui_games/Login/sign_up.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:sui_games/NavigationBar/NavigationBar.dart';
import 'package:sui_games/models/usuarios.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var db = FirebaseFirestore.instance;
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  List<Usuario> usuarios = List();

  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    listen?.cancel();
    listen = db.collection("usuarios").snapshots().listen((res) {
      setState(() {
        usuarios =
            res.docs.map((e) => Usuario.fromMap(e.data(), e.id)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/FundoTelaLogin.jpg"),
                  fit: BoxFit.cover)),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 70, bottom: 32),
                        child: Image.asset(
                          "lib/assets/logo.jpg",
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              TextFormField(
                                controller: txtEmail,
                                decoration: InputDecoration(
                                  hintText: "Username",
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: Colors.black,
                                  ),
                                ),
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                //  validator: (text) {
                                // if (text.isEmpty || !text.contains("@"))
                                //   return "E-mail inválido";
                                //  },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: txtSenha,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                validator: (text) {
                                  if (text.isEmpty || text.length < 6)
                                    return "Senha inválida";
                                },
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  onPressed: () {
                                    showAlertDialogESenha(context);
                                  },
                                  child: Text(
                                    "Esqueci minha senha",
                                    textAlign: TextAlign.right,
                                  ),
                                  padding: EdgeInsets.zero,
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
                                    'Logar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 0.3),
                                  ),
                                  onPressed: () {
                                    bool login = false;
                                    for (int i = 0; i < usuarios.length; i++) {
                                      if (usuarios[i].email == txtEmail.text &&
                                          usuarios[i].senha == txtSenha.text) {
                                        login = true;
                                      }
                                    }
                                    if (login) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NavigatorBar()),
                                      );
                                    } else {
                                      showAlertDialogLogin(context);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SignUpButton()
                    ],
                  ),
                  // StaggerAnimation(controller: _animationController.view)
                ],
              )
            ],
          )),
    );
  }
}
