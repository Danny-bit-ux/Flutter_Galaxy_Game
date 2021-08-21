import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_let_s_play/util/global_vars.dart';

import 'enity.dart';

class Bullet extends Enity {
  final double playerangle;
  double _speed = 5;
  Bullet({this.playerangle, double playerX, double playerY}) : super("bullet") {
    x = playerX;
    y = playerY;
  }

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: Transform.rotate(
        angle: playerangle,
        child: sprites.first,
      ),
    );
  }

  @override
  void move() {
    x += sin(playerangle) * _speed;
    x -= cos(playerangle) * _speed;
  }

  @override
  void update() {
    if (x > GlobalVars.screenWidth ||
        y > GlobalVars.screenHeight ||
        x < 0 ||
        y < 0) {
      visible = false;
    }
    move();
  }
}
