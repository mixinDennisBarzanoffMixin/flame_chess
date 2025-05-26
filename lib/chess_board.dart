import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_chess/chess_square.dart';
import 'package:flame_chess/constants.dart';
import 'package:flame_chess/domain/entities/square.dart';

class ChessBoard extends Component {
  ChessBoard() {}

  @override
  FutureOr<void> onLoad() {
    _buildBoard();
  }

  void _buildBoard() {
    // Entferne alle existierenden Komponenten
    removeAll(children);

    // Erstelle das Board neu
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        add(
          PositionComponent(
            position: Vector2(i * squareSize, j * squareSize),
            size: Vector2(squareSize, squareSize),
            children: [
              ChessSquare(
                isLight: (i + j) % 2 == 0,
                square: Square(x: i + 1, y: 7 - j + 1),
              )
            ],
          ),
        );
      }
    }
  }
}
