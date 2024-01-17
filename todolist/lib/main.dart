import 'package:flutter/material.dart';
import 'subDetail.dart';
import 'secondDetail.dart';
//add
import 'thirdPage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  static const String _title='Widget Example';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      initialRoute:'/',
      routes:{
        '/':(context)=>SubDetail(),
        '/second':(context)=>SecondDetail(),
        //add
        '/third':(context)=>ThirdDetail()
      },
    );
  }
}

