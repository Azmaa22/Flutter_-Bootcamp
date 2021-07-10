import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class IconContent extends StatelessWidget {
  final String textContent;
  final IconData iconContent;
  IconContent({@required this.iconContent, @required this.textContent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          //FontAwesomeIcons.venus,
          this.iconContent,
          size: kBottomCardHeight,
          color: Colors.white,
        ),
        Text(
          this.textContent,
          style: kFontStyle,
        ),
      ],
    );
  }
}
