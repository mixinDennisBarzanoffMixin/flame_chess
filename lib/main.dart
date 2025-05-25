import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/widgets.dart';
import 'package:flame_chess/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final gameKey = GlobalKey<RiverpodAwareGameWidgetState>();
  final game = ChessGame(gameKey);
  runApp(
    ProviderScope(child: RiverpodAwareGameWidget(game: game, key: gameKey)),
  );
}
