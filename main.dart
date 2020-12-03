import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sui_games/Live/NovaLive.dart';
import 'package:sui_games/Players/NovoPlayer.dart';
import 'package:sui_games/Search/NovoJogo.dart';
import 'package:sui_games/Start/Start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/principal',
    routes: {
      '/principal': (context) => Start(),
      '/cadastrolive': (context) => NovaLive(),
      '/cadastrojogador': (context) => NovoPlayer(),
      '/cadastroJogos': (context) => NovoJogo(),
    },
  ));
}
