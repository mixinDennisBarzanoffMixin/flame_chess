import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/layout.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_chess/chess_bloc.dart';
import 'package:flame_chess/chess_board.dart';
import 'package:flame_chess/constants.dart';
import 'package:flame_chess/figures/bishop.dart';

class ChessGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(
      FlameBlocProvider<ChessBloc, ChessState>(
        create: () => ChessBloc(),
        children: [
          ChessBoard(),
          PositionComponent(
            position: Vector2(SQUARE_SIZE * 4, SQUARE_SIZE * 6),
            size: Vector2(SQUARE_SIZE, SQUARE_SIZE),
            children: [
              AlignComponent(
                alignment: Anchor.center,
                child: Bishop(isLight: true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
