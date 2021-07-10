import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
 // const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber, rightDiceNumber ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   leftDiceNumber = rightDiceNumber = 1;
  }
  void changeDiceNumbers(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          children: [
            Expanded(
                child: FlatButton(
                    onPressed: (){
                     changeDiceNumbers();
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'))

            ),

            Expanded(
                child: FlatButton(
                    onPressed: (){
                      changeDiceNumbers();
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'))

            ),
          ],
        ),
      ),
    );
  }
}

/*Solution 01
Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          children: [
            Expanded(
                child: FlatButton(
                    onPressed: (){
                      setState(() {
                        leftDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'))

            ),

            Expanded(
                child: FlatButton(
                    onPressed: (){
                      setState(() {
                        rightDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'))

            ),
          ],
        ),
      ),
    );
  }
* */
/*Solution 02
 Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          children: [
            Expanded(
                child: FlatButton(
                    onPressed: (){
                      setState(() {
                        leftDiceNumber = Random().nextInt(6) + 1;
                        rightDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'))

            ),

            Expanded(
                child: FlatButton(
                    onPressed: (){
                      setState(() {
                        rightDiceNumber = Random().nextInt(6) + 1;
                        leftDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'))

            ),
          ],
        ),
      ),
    );
  }
* */

