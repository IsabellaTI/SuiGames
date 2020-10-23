import 'package:flutter/material.dart';
import 'package:sui_games/Streaming/Streaming.dart';

showAlertDialogStreaming(BuildContext context) {
  Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      });
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Atenção"),
    content:
        Text("Infelizmente no momento não é possível iniciar uma transmissão!"),
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
