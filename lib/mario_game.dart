import 'package:flame/game.dart';
import 'package:mario/actors/mario.dart';

import 'actors/enemy.dart';
import 'managers/segment_manager.dart';
import 'objects/ground_block.dart';
import 'objects/platform_block.dart';
import 'objects/star.dart';
import 'package:flutter/material.dart';

class MarioGame extends FlameGame {
  MarioGame();

  late MarioPlayer _mario;
  double objectSpeed = 0.0;
  final Vector2 velocity = Vector2.zero();

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'mario.png',
      'jmario.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'enemy.png',
      'water_enemy.png',
      'health.png'
    ]);
    initializeGame();
  }

  void initializeGame() {
    // Assume that size.x < 3200
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _mario = MarioPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );
    add(_mario);
  }

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case GroundBlock:
          break;
        case PlatformBlock:
          add(PlatformBlock(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
        case Star:
          add(Star(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
        case Enemy:
          add(Enemy(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
      }
    }
  }
}
