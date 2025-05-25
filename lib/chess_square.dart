import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ChessSquare extends Component {
  bool isLight;
  String name;
  ChessSquare({required this.isLight, required this.name}) {}

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, 100, 100),
        Paint()
          ..style = PaintingStyle.fill
          ..color = isLight ? Color(0xffEBECD0) : Color(0xff779556));
    final textPainter = TextPainter(
        text: TextSpan(text: name, style: const TextStyle(color: Colors.black)),
        textDirection: TextDirection.ltr);
    textPainter.layout();
    textPainter.paint(canvas, Offset(0, 0));
    super.render(canvas);
  }
}
