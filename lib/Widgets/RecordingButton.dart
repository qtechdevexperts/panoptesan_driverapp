import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  final Function onPressed;
  final double? whitewidth;
  final double? whiteheight;
  final double? redheight;

  final double? redwidth;

  const RoundedElevatedButton(
      {required this.whiteheight,
      required this.whitewidth,
      required this.redheight,
      required this.redwidth,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        elevation: 10,
        primary: Colors.red,
        shape: CircleBorder(),
      ),
      child: Container(
        width: redwidth,
        height: redheight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Center(
          child: Container(
            width: whitewidth,
            height: whiteheight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
