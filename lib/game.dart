import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/layout.dart';
import 'package:flame_chess/chess_board.dart';
import 'package:flame_chess/constants.dart';
import 'package:flame_chess/figures/bishop.dart';

class ChessGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(ChessBoard());
    add(PositionComponent(
        position: Vector2(squareSize * 4, squareSize * 6),
        size: Vector2(squareSize, squareSize),
        children: [
          AlignComponent(alignment: Anchor.center, child: Bishop(isLight: true))
        ]));
    super.onLoad();
  }
}
