import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ChessSquare extends Component {
  bool isLight;
  ChessSquare({required this.isLight}) {}

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, 100, 100),
        Paint()
          ..style = PaintingStyle.fill
          ..color = isLight ? Color(0xffEBECD0) : Color(0xff779556));
    super.render(canvas);
  }
}
