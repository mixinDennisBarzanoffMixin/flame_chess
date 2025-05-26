import 'package:flame_chess/constants.dart';

class Square {
  final int x;
  final int y;

  Square({required this.x, required this.y});

  @override
  String toString() {
    return '${SQUARES[x]}$y';
  }

  @override
  bool operator ==(Object other) {
    if (other is Square) {
      return x == other.x && y == other.y;
    }
    return false;
  }
}
