import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:flutter/material.dart';

Widget customTextFeild({String? title,String? hint,controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color( Color.fromRGBO(143, 148, 251, 1)).bold.size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintStyle: TextStyle(
            color: Colors.grey.shade200,
            ),
            hintText: hint,
            isDense: true,
            fillColor: Colors.grey.shade200,
            filled: true,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:  Color.fromRGBO(143, 148, 251, 1)
                )
            )
        ),
      ),
      5.heightBox
    ],
  );
}