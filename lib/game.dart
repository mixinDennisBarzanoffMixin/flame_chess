import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_chess/chess_board.dart';

class ChessGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Berechne die kleinere Dimension für ein perfektes 1:1 Verhältnis
    final gameSize = canvasSize.x < canvasSize.y ? canvasSize.x : canvasSize.y;

    final camera = CameraComponent.withFixedResolution(
        width: gameSize, height: gameSize, world: world);
    add(camera);
    camera.viewfinder.anchor = Anchor.center;
    add(ChessBoard());
    super.onLoad();
  }
}
