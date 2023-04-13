// import 'dart:io';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final widthh;
  final validator;
  final maxline;
  final hintColor;
  final underlineColor;
  final controller;
  final hintText;
  final suffix;
  final hintstyle;
  final fillcolor;

  CustomTextField({
    Key? key,
    this.fillcolor,
    this.hintstyle,
    this.suffix,
    this.maxline,
    this.validator,
    this.hintText,
    required this.underlineColor,
    required this.hintColor,
    required this.widthh,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthh,
      child: TextFormField(
        maxLines: maxline,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        style: TextStyle(color: hintColor),
        cursorColor: Colors.black,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffix,
          fillColor: fillcolor,
          hintText: hintText,
          filled: true,
          hintStyle: hintstyle,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: underlineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: underlineColor),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: underlineColor),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: underlineColor),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
