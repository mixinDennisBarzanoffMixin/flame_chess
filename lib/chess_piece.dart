import 'package:flame/components.dart';

class ChessPiece extends SpriteComponent {
  ChessPiece({required super.position, required super.size}) {}
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('LightPawn.webp');
    super.onLoad();
  }
}
