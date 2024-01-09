import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CircleWithNumber extends StatelessWidget {
  final int number;
  final double radius;
  final Color color;
  final TextStyle textStyle;

  const CircleWithNumber({
    Key? key,
    required this.number,
    required this.radius,
    required this.color,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: _CircleWithNumberPainter(number: number, color: color, textStyle: textStyle),
    );
  }
}

class _CircleWithNumberPainter extends CustomPainter {
  final int number;
  final Color color;
  final TextStyle textStyle;

  _CircleWithNumberPainter({
    required this.number,
    required this.color,
    required this.textStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint);

    final textSpan = TextSpan(
      text: number.toString(),
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Circle With Number')),
      body: Center(
        child: CircleWithNumber(
          number: 7,
          radius: 100,
          color: Colors.blue,
          textStyle: TextStyle(fontSize: 48, color: Colors.white),
        ),
      ),
    ),
  ));
}