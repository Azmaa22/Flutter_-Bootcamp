import 'package:flutter/material.dart';
import 'package:bmi_calculator/utilities/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';


class ResultPage extends StatelessWidget {
 final String bmiTextTitle, bmiNumber, bmiTextBody;
 ResultPage({@required this.bmiTextTitle, @required this.bmiNumber, @required this.bmiTextBody});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',style: kResultTitleStyle,)),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveGenderColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiTextTitle,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiNumber,
                    style: kBmiNumberStyle,
                  ),
                  Text(
                    bmiTextBody,
                    style: kBmiTextStyle,
                    textAlign: TextAlign.center,

                  ),

                ],
              ),
            ),
          ),
          BottomButton(buttonText:'RE-CALCULATE',onPress:(){
            Navigator.pop(context);
          }),

        ],
      ),
    );
  }
}
