import 'dart:ui';

import 'package:flutter/material.dart';

class DottedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashWidth = 20.0; // عرض الخط المتقطع
    double dashSpace = 20.0; // المسافة بين الخطوط المتقطعة

    // تحديد الحواف الدائرية
    final borderRadius = BorderRadius.circular(20.0); // حواف دائرية أكبر

    // رسم مستطيل بحواف دائرية
    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height), borderRadius.topLeft));

    _drawDottedLine(canvas, path, paint, dashWidth, dashSpace);
  }

  void _drawDottedLine(Canvas canvas, Path path, Paint paint, double dashWidth,
      double dashSpace) {
    PathMetric pathMetric = path.computeMetrics().first;
    double length = pathMetric.length;
    for (double i = 0; i < length; i += dashWidth + dashSpace) {
      double start = i;
      double end = i + dashWidth;
      if (end > length) end = length;
      Path dashPath = pathMetric.extractPath(start, end);
      canvas.drawPath(dashPath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
