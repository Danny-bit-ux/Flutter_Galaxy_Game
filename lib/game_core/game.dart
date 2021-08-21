import 'dart:isolate';

import 'package:flutter/material.dart';

import 'package:flutter_let_s_play/game_core/main_loop.dart';
import 'package:flutter_let_s_play/util/global_vars.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final ReceivePort _receivePort = ReceivePort();
  late final Isolate _isolateLoop;

  void startIsolateLoop() async {
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      GlobalVars.currentScene.update();
      setState(() {});
    });
  }

  @override
  void initState() {
    startIsolateLoop();

    super.initState();
  }

  @override
  void dispose() {
    _receivePort.close();
    _isolateLoop.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalVars.currentScene.buildScene();
  }
}
