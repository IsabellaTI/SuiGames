import 'package:flutter/material.dart';

showAlertDialogSupportJogo(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () => Navigator.pop(context),
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Atenção"),
    content: Text("Infelizmente no momento não é possível avaliar este jogo!"),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
