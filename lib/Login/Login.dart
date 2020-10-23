import 'package:flutter/material.dart';
import 'package:sui_games/NavigationBar/NavigationBar.dart';
import 'package:sui_games/Login/form_container.dart';
import 'package:sui_games/Login/sign_up.dart';
import 'package:sui_games/Login/stagger_animation.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

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
                      FormContainer(),
                      SignUpButton()
                    ],
                  ),
                  StaggerAnimation(controller: _animationController.view)
                ],
              )
            ],
          )),
    );
  }
}
