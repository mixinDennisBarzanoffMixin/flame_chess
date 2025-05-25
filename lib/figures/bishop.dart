import 'package:flame/components.dart';
import 'package:flame_chess/constants.dart';
import 'package:flame_chess/figures/chess_piece.dart';

class Bishop extends SpriteComponent with ChessPiece {
  bool isLight;
  Bishop({required this.isLight}) {}
  @override
  Future<void> onLoad() async {
    size = Vector2(squareSize * 0.8, squareSize * 0.8);
    sprite =
        await Sprite.load(isLight ? 'LightBishop.webp' : 'DarkBishop.webp');
    super.onLoad();
  }
}
