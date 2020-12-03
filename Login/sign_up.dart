import 'package:flutter/material.dart';
import 'package:sui_games/Register/Register.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 160),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Register()));
      },
      child: Text(
        "Não possui uma conta? Cadastre-se!",
        style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 12,
            letterSpacing: 0.5),
      ),
    );
  }
}
