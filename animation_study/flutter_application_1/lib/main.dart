import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _weatherState = 'Sunny'; // 날씨 상태 (예: Sunny, Cloudy)
  double _temperature = 25.0; // 온도

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_weatherState',
              style: Theme.of(context).textTheme.headline4,
            ),
            FadeTransition(
              opacity: _animation,
              child: WeatherIcon(weatherState: _weatherState),
            ),
            Text(
              '${_temperature.toStringAsFixed(1)}°C',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final String weatherState;

  WeatherIcon({required this.weatherState});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (weatherState) {
      case 'Cloudy':
        iconData = Icons.cloud;
        break;
      case 'Rainy':
        iconData = Icons.grain;
        break;
      // 기타 날씨 상태에 따른 아이콘 추가 가능
      default: // 'Sunny' 등 기타 상태
        iconData = Icons.wb_sunny;
        break;
    }
    return Icon(iconData, size: 100);
  }
}
