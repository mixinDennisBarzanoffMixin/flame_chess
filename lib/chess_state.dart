import 'package:riverpod/riverpod.dart';

class Square {
  final int x;
  final int y;
  Square({required this.x, required this.y});
}

final chessState = StateProvider<Square?>((ref) {
  return null;
});
