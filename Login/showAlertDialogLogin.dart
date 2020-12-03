import 'package:flutter/material.dart';

showAlertDialogLogin(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção"),
          content: Text("E-mail ou senha inválido!"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      });
}
