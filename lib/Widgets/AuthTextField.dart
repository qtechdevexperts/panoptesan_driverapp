// import 'dart:io';

import 'package:flutter/material.dart';

import '../helpers/Colors.dart';

class AuthTextField extends StatelessWidget {
  final widthh;
  final validator;
  final isPassword;
  final labelText;
  final prefixIcon;
  final suffixIcon;
  final labelColor;
  final hintColor;
  final underlineColor;
  final controller;
  final hintText;

  AuthTextField(
      {Key? key,
      this.validator,
      this.hintText,
      required this.underlineColor,
      required this.labelColor,
      required this.hintColor,
      required this.widthh,
      required this.isPassword,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthh,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        style: TextStyle(color: hintColor),
        cursorColor: white,
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: labelColor),
          hintStyle: TextStyle(color: hintColor),
          suffixIcon: suffixIcon,
          prefixIcon:
              Padding(padding: const EdgeInsets.all(14.0), child: prefixIcon),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
