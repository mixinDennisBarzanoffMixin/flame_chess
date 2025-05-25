import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flame_chess/game.dart';

void main() {
  final game = ChessGame();
  runApp(GameWidget(game: game));
}
