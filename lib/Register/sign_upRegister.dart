import 'package:flutter/material.dart';

class SignUpButtonRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 160),
      onPressed: () {},
      child: Text(
        "Outras opções",
        style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 12,
            letterSpacing: 0.5),
      ),
    );
  }
}
