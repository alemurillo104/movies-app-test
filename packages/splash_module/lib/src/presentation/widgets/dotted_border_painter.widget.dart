import 'dart:ui';
import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  const DottedBorderPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const double dashLength = 6;
    const double spaceLength = 3;

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(4),
        ),
      );

    canvas.drawPath(
      path.dashPath([dashLength, spaceLength]),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

extension DashPath on Path {
  Path dashPath(List<double> segments) {
    final Path result = Path();
    for (final PathMetric metric in computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      while (distance < metric.length) {
        final double segment = segments[draw ? 0 : 1];
        final double nextDistance = distance + segment;

        if (draw) {
          result.addPath(
            metric.extractPath(distance, nextDistance),
            Offset.zero,
          );
        }
        distance = nextDistance;
        draw = !draw;
      }
    }
    return result;
  }
}
