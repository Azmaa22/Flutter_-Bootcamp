import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';

class BottomButton extends StatelessWidget {

  final Function onPress;
  final String buttonText;
  BottomButton({this.buttonText, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:this.onPress,
      child: Container(
        color: kBottomCardColor,
        height: kBottomCardHeight,
        width: double.infinity,

        child: Center(child: Text(this.buttonText,style: kBottomButtonTextStyle,)),
      ),
    );
  }
}
