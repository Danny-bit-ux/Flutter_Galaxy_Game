import 'dart:math';

import 'package:flutter/material.dart';

import 'enity.dart';

class Bullet extends Enity {
  final double playerangle;
  double _speed = 5;
  Bullet(
      {required this.playerangle,
      required double playerX,
      required double playerY})
      : super("bullet") {
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
        child: sprites[currentSprite],
      ),
    );
  }

  @override
  void move() {
    x += sin(playerangle) * _speed;
    y -= cos(playerangle) * _speed;
  }
}
