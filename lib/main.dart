import 'package:crud/Screen/ProductGridViewScreen.dart';
import 'package:crud/Screen/ProuctCreateScreen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD APP',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ProductGridViewScreen(),
    );
  }
}


