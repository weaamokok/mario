import 'package:flame/components.dart';
import '../mario_game.dart';

//This file uses the HasGameRef mixin which allows us to reach back to mario_game.dart and leverage any of the variables or methods that are defined in the game class. You can see this in use with the line game.images.fromCache('mario.png').
class MarioPlayer extends SpriteAnimationComponent with HasGameRef<MarioGame> {
  MarioPlayer({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    // final mario = game.images.fromCache('mario.png');
    // sprite = Sprite(mario);

    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('mario.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }
}
