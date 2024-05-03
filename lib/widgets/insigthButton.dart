import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget insightsButton({width,height,onpress,String? value,String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      value!.text.bold.size(15).color(Colors.black).make(),
      5.heightBox,
      title!.text.wrapWords(true).bold.size(8).color(Colors.grey).makeCentered(),
    ],
  ).box
      .width(width)
      .height(height)
      .p12
      .rounded
      .white
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .make().onTap(() => onpress);
}