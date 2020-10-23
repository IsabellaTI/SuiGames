import 'package:flutter/material.dart';

showAlertDialogSupport(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () => Navigator.pop(context),
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Atenção"),
    content: Text("Infelizmente no momento não é possível enviar sugestões!"),
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
