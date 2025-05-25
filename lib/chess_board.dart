import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_chess/chess_square.dart';

class ChessBoard extends Component {
  ChessBoard() {}

  @override
  FutureOr<void> onLoad() {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        add(PositionComponent(
            position: Vector2(i * 100, j * 100),
            size: Vector2(100, 100),
            children: [ChessSquare(isLight: (i + j) % 2 == 0)]));
      }
    }
  }
}
