import 'package:flutter/material.dart';

import '../home_screen/ui/widgets/curved_painter.dart';

class VisaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // الجزء الأبيض السفلي
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),
          // الجزء العلوي الأزرق مع الكيرف
          Positioned.fill(
            child: CustomPaint(
              painter: CurvedPainter(),
            ),
          ),
          // محتوى الشاشة
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello, Flutter!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Hello, Flutter!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Hello, Flutter!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'This is a curved design.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


