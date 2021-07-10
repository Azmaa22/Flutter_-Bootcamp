import 'package:flutter/material.dart';

void main() {
  final GlobalKey<ScaffoldState> _scafId = GlobalKey<ScaffoldState>();
  runApp(MaterialApp(
    home:Scaffold(
      key: _scafId,
     appBar: AppBar(
       title: Center(child: Text('I Am Rich'),),
       backgroundColor: Colors.blueGrey[900],
     ),
      body: Center(
        child: Image(//'images/sunflower.png'
          width: 200,
          height: 200,
          //image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
          image: AssetImage('images/diamond.png'),
          //color: Colors.amber,
        )
      ),

    ),
  ));
}
