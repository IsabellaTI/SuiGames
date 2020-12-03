import 'package:flutter/material.dart';

showAlertDialogESenha(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção"),
          content: Text("Opção indisponível no momento!"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      });
}
