import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Canvas Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Canvas Drawing Example'),
        ),
        body: Center(
          child: CustomPaint(
            size: Size(200, 200), // CustomPaint의 크기를 지정
            painter: MyCustomPainter(), // CustomPainter 클래스의 인스턴스
          ),
        ),
      ),
    );
  }
}

// CustomPainter를 상속받는 MyCustomPainter 클래스
class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint 클래스를 사용하여 원의 스타일을 정의
    var paint = Paint()
      ..color = Colors.blue // 색상: 파란색
      ..strokeWidth = 5 // 선의 두께: 5
      ..style = PaintingStyle.stroke; // 스타일: 선 그리기

    // Canvas에 원을 그림
    canvas.drawCircle(Offset(100, 100), 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 여기서는 동적으로 변하는 그래픽이 없으므로 false를 반환
    return false;
  }
}
