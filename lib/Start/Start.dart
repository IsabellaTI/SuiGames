import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sui_games/Start/Button.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> with SingleTickerProviderStateMixin {
  VideoPlayerController _controller;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }

    _controller = VideoPlayerController.asset('lib/assets/MovieHome.mov')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    Timer.periodic(Duration(seconds: 15), (Timer t) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return MaterialApp(
      title: 'Sui Games',
      home: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          ButtonStart(),
        ],
      )),
    );
  }
}
