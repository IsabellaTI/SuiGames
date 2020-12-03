import 'package:flutter/material.dart';
import 'package:sui_games/Players/ListData.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> ListSlidePosition;

  AnimatedListView({@required this.ListSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        // ListData(
        //  title: "1",
        // subtitle: "2",
        // image: AssetImage("lib/assets/logo.jpg"),
        //  margin: ListSlidePosition.value * 1,
        // ),
        // ListData(
        //  title: "11",
        //  subtitle: "21",
        //   image: AssetImage("lib/assets/logo.jpg"),
        //   margin: ListSlidePosition.value * 1,
        // )
      ],
    );
  }
}
