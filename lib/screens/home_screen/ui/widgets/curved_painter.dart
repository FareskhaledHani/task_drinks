import 'package:flutter/material.dart';

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF0E294E) // اللون الأزرق
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, size.height * 0.6); // النقطة الأولى للمنحنى
    path.quadraticBezierTo(
      size.width / 1.5, // النقطة التي يمر بها المنحنى
      size.height * 0.4, // تعديل النقطة لجعل الكيرف للأعلى
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0); // العودة للحافة العلوية
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}