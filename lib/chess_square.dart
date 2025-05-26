import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_chess/chess_bloc.dart';
import 'package:flame_chess/constants.dart';
import 'package:flame_chess/domain/entities/square.dart';
import 'package:flutter/material.dart';

class ChessSquare extends Component
    with TapCallbacks, FlameBlocReader<ChessBloc, ChessState> {
  bool isLight;
  Square square;
  bool showText;
  ChessSquare(
      {required this.isLight, required this.square, required this.showText}) {}

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, 100, 100),
        Paint()
          ..style = PaintingStyle.fill
          ..color = isLight ? Color(0xffEBECD0) : Color(0xff779556));
    if (showText) {
      final name = '${SQUARES[square.x]}${square.y}';
      final textPainter = TextPainter(
          text:
              TextSpan(text: name, style: const TextStyle(color: Colors.black)),
          textDirection: TextDirection.ltr);
      textPainter.layout();
      textPainter.paint(canvas, Offset(0, 0));
    }
    super.render(canvas);
  }

  @override
  void onMount() {
    super.onMount();
  }

  @override
  void onTapDown(TapDownEvent event) {
    print('onTapDown');
    bloc.selectSquare(square!);
    super.onTapDown(event);
  }

  @override
  bool containsLocalPoint(Vector2 point) {
    return point.x >= 0 && point.x <= 100 && point.y >= 0 && point.y <= 100;
  }
}
