import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_chess/chess_square.dart';
import 'package:flame_chess/constants.dart';

class ChessBoard extends Component {
  ChessBoard() {}

  @override
  FutureOr<void> onLoad() {
    const squares = {
      0: 'A',
      1: 'B',
      2: 'C',
      3: 'D',
      4: 'E',
      5: 'F',
      6: 'G',
      7: 'H'
    };
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        add(PositionComponent(
            position: Vector2(i * squareSize, j * squareSize),
            size: Vector2(squareSize, squareSize),
            children: [
              ChessSquare(
                  isLight: (i + j) % 2 == 0, name: '${squares[i]}${7 - j + 1}')
            ]));
      }
    }
  }
}
