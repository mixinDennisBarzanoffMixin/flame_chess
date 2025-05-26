import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_chess/chess_bloc.dart';
import 'package:flame_chess/chess_square.dart';
import 'package:flame_chess/constants.dart';
import 'package:flame_chess/domain/entities/square.dart';
import 'package:flame_bloc/flame_bloc.dart';

class ChessBoard extends Component
    with FlameBlocListenable<ChessBloc, ChessState> {
  ChessBoard() {}

  @override
  FutureOr<void> onLoad() {
    _buildBoard(ChessState(selectedSquare: null));
  }

  @override
  void onNewState(ChessState state) {
    _buildBoard(state);
  }

  void _buildBoard(ChessState state) {
    // Entferne alle existierenden Komponenten
    removeAll(children);
    print(
        'build board: ${state.selectedSquare?.x}, ${state.selectedSquare?.y}');
    final diagonals = _calcDiagonals(state);

    // Erstelle das Board neu
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        add(
          PositionComponent(
            position: Vector2(i * SQUARE_SIZE, j * SQUARE_SIZE),
            size: Vector2(SQUARE_SIZE, SQUARE_SIZE),
            children: [
              () {
                final square = Square(x: i + 1, y: 7 - j + 1);
                return ChessSquare(
                  isLight: (i + j) % 2 == 0,
                  showText: () {
                    if (diagonals.contains(square)) {
                      return true;
                    }
                    if (state.selectedSquare == square) {
                      return true;
                    }
                    return false;
                  }(),
                  square: square,
                );
              }(),
            ],
          ),
        );
      }
    }
  }

  List<Square> _calcDiagonals(ChessState state) {
    final squares = <Square>[];
    final square = state.selectedSquare;
    if (square == null) {
      return [];
    }
    bool isWithinBoard(int x, int y) {
      return x >= 1 && y >= 1 && x <= 8 && y <= 8;
    }

    for (int i = square.x - 1, j = square.y - 1;
        isWithinBoard(i, j);
        i--, j--) {
      squares.add(Square(x: i, y: j));
    }
    for (int i = square.x - 1, j = square.y + 1;
        isWithinBoard(i, j);
        i--, j++) {
      squares.add(Square(x: i, y: j));
    }
    for (int i = square.x + 1, j = square.y - 1;
        isWithinBoard(i, j);
        i++, j--) {
      squares.add(Square(x: i, y: j));
    }
    for (int i = square.x + 1, j = square.y + 1;
        isWithinBoard(i, j);
        i++, j++) {
      squares.add(Square(x: i, y: j));
    }
    return squares;
  }
}
