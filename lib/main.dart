import 'package:flutter/material.dart';
import 'package:world_info/pages/details.dart';
import 'package:world_info/pages/list.dart';
import 'package:world_info/pages/loading.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => ListPage(),
        '/details': (context) => DetailPage(),
      },
      title: 'World Info',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
    );
  }
}
