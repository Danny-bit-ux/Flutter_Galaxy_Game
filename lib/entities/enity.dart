import 'package:flutter/cupertino.dart';

abstract class Enity {
  double x = 0;
  double y = 0;
  final String spritename;
  bool visible = true;
  List sprites = [];
  int currentSprite = 0;
  int currentTick = 0;

  Enity(this.spritename) {
    for (var i = 0; i < 4; i++) {
      sprites.add(Image.asset('assets/$spritename$i.png'));
    }
  }
  void _animate() {
    currentTick++;
    if (currentTick > 15) {
      currentSprite++;
      currentTick = 0;
    }
    if (currentSprite > 3) {
      currentSprite = 0;
    }
  }

  void update() {
    _animate();
    move();
  }

  void move();

  Widget build();
}
