import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
home: Scaffold(
  backgroundColor: Colors.cyan[700],
  appBar: AppBar(
    title: Center(child: Text('I Am Poor'),),
      backgroundColor: Colors.blueGrey[900],
  ),
  body: Center(
    child: Image(
      image: AssetImage('images/poor.png'),
      width: 250,
      height: 250,
    ),
  ),
),
  ));
}
