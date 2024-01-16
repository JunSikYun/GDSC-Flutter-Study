import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 페인트 객체 생성
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke; // 원의 외곽선만 그립니다.

    // 화면 중앙에 원을 그립니다.
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 같은 그림을 다시 그릴 필요가 없으므로 false를 반환합니다.
    return false;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Painter Example')),
        body: Center(
          child: CustomPaint(
            size: Size(200, 200), // CustomPainter의 크기를 지정합니다.
            painter: MyCustomPainter(),
          ),
        ),
      ),
    );
  }
}

