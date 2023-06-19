import 'package:flutter/material.dart';
import 'package:quizz/widgets/colors.dart';

class CustomButton extends Text{
  CustomButton(
      String data,
      {super.key,fontSize= 20.0 ,color=color2,textAlign = TextAlign.center, factor = 1.0}) :
        super(
          data, textScaleFactor: factor,
          style: TextStyle(fontSize: fontSize,color: color)
      );


}
ElevatedButton elevatedButton (bool b,Function() action,Color color,double size){
  return ElevatedButton(
      onPressed: action,
      child: Text(
        (b)?"vrai":"faux",
        style:  TextStyle(
                  color: color,
          fontSize: size
        ),
      )
  );

}