import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  Function onTap;
  RoundIconButton({this.icon,this.onTap});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (){onTap();},
      child: Icon(icon,color: Colors.white,),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}