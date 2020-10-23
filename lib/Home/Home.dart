import 'package:flutter/material.dart';
import 'package:sui_games/Developer/Developer.dart';
import 'package:sui_games/Streaming/Streaming.dart';
import 'package:sui_games/Support/Support.dart';
import 'package:sui_games/items/Custom_Drawer.dart';
import 'package:sui_games/Home/Home_Items.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final _pageController = PageController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Transmissão"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Streaming(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Suporte"),
            centerTitle: true,
          ),
          body: Support(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Desenvolvedor(a)"),
            centerTitle: true,
          ),
          body: Developer(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
