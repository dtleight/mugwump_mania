import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
    MyApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mugwump Mania',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
