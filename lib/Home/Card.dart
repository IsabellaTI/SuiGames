import 'dart:ui';

import 'package:flutter/material.dart';

class AppBarTransparent extends StatelessWidget {
  Container MyArticles(String imageVal, String heading, String subHeading) {
    return Container(
      width: 160.0,
      child: Card(
          child: Wrap(
        children: <Widget>[
          Image.network(imageVal),
          ListTile(
            title: Text(heading),
            subtitle: Text(subHeading),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MyArticles(
              "lib/assets/League_of_Legends.jpg", "League_of_Legends", "MOBA"),
          MyArticles(
              "lib/assets/Alien_Isolation.jpg", "Alien Isolation", "ACTION"),
          MyArticles("lib/assets/Skyrim.jpg", "Skyrim", "RPG"),
          MyArticles("lib/assets/The_Elder_Scrolls_Online.jpg",
              "The Elder Scrolls Online", "MMORPG"),
          MyArticles("lib/assets/Dota_2.jpg", "Dota II", "MOBA"),
        ],
      ),
    );
  }
}
