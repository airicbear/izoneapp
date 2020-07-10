import 'package:flutter/material.dart';
import 'package:izoneapp/members.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IZ*ONE',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        cardColor: Color.fromRGBO(35, 35, 35, 1.0),
        canvasColor: Colors.black,
      ),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MembersList(title: 'IZ*ONE'),
    );
  }
}
