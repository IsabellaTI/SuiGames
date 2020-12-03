import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sui_games/NavigationBar/NavigationBar.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  //var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  // var txtDicaSenha = TextEditingController();

  var db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigatorBar()));
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                              /* SizedBox(height: 20),
                              TextFormField(
                                controller: txtNome,
                                decoration: InputDecoration(
                                  hintText: "Username",
                                  prefixIcon: Icon(
                                    Icons.person_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                //validator: (text) {
                                // if (text.isEmpty || !text.contains("@"))
                                //   return "Username inválido";
                                //  },
                              ),
                              */
                              SizedBox(height: 20),
                              TextFormField(
                                controller: txtEmail,
                                decoration: InputDecoration(
                                  hintText: "E-mail",
                                  prefixIcon: Icon(
                                    Icons.local_post_office,
                                    color: Colors.black,
                                  ),
                                ),
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                validator: (text) {
                                  if (text.isEmpty || !text.contains("@"))
                                    return "E-mail inválido";
                                },
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
                              /*  SizedBox(height: 20),
                              TextFormField(
                                controller: txtDicaSenha,
                                decoration: InputDecoration(
                                  hintText: "Dica Password",
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                validator: (text) {
                                  if (text.isEmpty || text.length < 6)
                                    return "Senha inválida";
                                },
                              ),
                              */
                              Align(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Ajuda",
                                    textAlign: TextAlign.right,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              )
                            ],
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
                            'Confirmar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.3),
                          ),
                          onPressed: () async {
                            await db.collection("usuarios").add({
                              // "nome": txtNome.text,
                              "email": txtEmail.text,
                              "senha": txtSenha.text,
                              // "dicasenha": txtDicaSenha.text
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigatorBar()),
                            );

                            // Navigator.push(
                            //  context,
                            // MaterialPageRoute(
                            //  builder: (context) => Inicial()),
                            //);
                          },
                        ),
                      ),
                      //  SignUpButtonRegister(),
                    ],
                  ),
                  //  StaggerAnimationRegister(
                  //  controller: _animationController.view)
                ],
              )
            ],
          )),
    );
  }
}
