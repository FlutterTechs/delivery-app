import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget ourButton({String? title,onpress,color,textColor}){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(12)
      ),
      onPressed: onpress,
      child: title!.text.color(textColor).make());
}