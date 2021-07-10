import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg?w=800&quality=85'),
                ),
                Text(
                  "Harry Potter",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "American Actor",
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      color: Colors.teal.shade100,
                      fontWeight: FontWeight.bold,
                  letterSpacing: 2),
                ),
                Divider(
                  color: Colors.teal.shade100,
                  indent: 150,
                  endIndent: 150,
                  thickness: 2,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                  child: ListTile(
                    leading: Icon(Icons.phone,color: Colors.teal,),
                    title: Text('+020 101 506 9799',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                  child: ListTile(
                    leading: Icon(Icons.mail,color: Colors.teal,),
                    title: Text('HPotter33@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    ),
  );
}

///Flutter Layouts Challenge
/*
body: SafeArea(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.0,
                  color:Colors.red,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     width: 100.0,
                     height: 100.0,
                     color: Colors.yellow,
                   ),
                   Container(
                     width: 100.0,
                     height: 100.0,
                     color: Colors.green,
                   ),
                 ],
                ),
                Container(
                  width: 100.0,
                  color:Colors.blue,
                ),
              ],
            )
          ),
        ),
*/
