import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:mario/mario_game.dart';

void main() {
  runApp(
    const GameWidget<MarioGame>.controlled(
      gameFactory: MarioGame.new,
    ),
  );
}
