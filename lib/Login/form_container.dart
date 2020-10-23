import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            TextFormField(
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
                if (text.isEmpty || text.length < 6) return "Senha inválida";
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              ),
            )
          ],
        ),
      ),
    );
  }
}
