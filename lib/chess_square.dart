import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_chess/chess_state.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';

class ChessSquare extends Component with TapCallbacks, RiverpodComponentMixin {
  bool isLight;
  Square square;
  ChessSquare({required this.isLight, required this.square}) {}

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, 100, 100),
        Paint()
          ..style = PaintingStyle.fill
          ..color = isLight ? Color(0xffEBECD0) : Color(0xff779556));
    const squares = {
      1: 'A',
      2: 'B',
      3: 'C',
      4: 'D',
      5: 'E',
      6: 'F',
      7: 'G',
      8: 'H'
    };
    final name = '${squares[square.x].toString()}${square.y}';
    final textPainter = TextPainter(
        text: TextSpan(text: name, style: const TextStyle(color: Colors.black)),
        textDirection: TextDirection.ltr);
    textPainter.layout();
    textPainter.paint(canvas, Offset(0, 0));
    super.render(canvas);
  }

  @override
  void onTapDown(TapDownEvent event) {
    print('onTapDown');
    ref.read(chessState.notifier).state = square;
    super.onTapDown(event);
  }

  @override
  bool containsLocalPoint(Vector2 point) {
    return point.x >= 0 && point.x <= 100 && point.y >= 0 && point.y <= 100;
  }
}
