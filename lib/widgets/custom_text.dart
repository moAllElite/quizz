import 'package:flutter/material.dart';

class CustomText extends Text{
  CustomText(
      String data,
      {super.key,fontSize= 20.0 ,textAlign = TextAlign.center, factor = 1.0}) :
        super(
          data, textScaleFactor: factor,
          style: TextStyle(fontSize: fontSize)
      );


}