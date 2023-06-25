import 'package:flutter/material.dart';

class RoundedBlueButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double buttonheight;
  final double fontsize;

  const RoundedBlueButton(
      {required this.buttonText,
      required this.onPressed,
      required this.buttonheight,
      required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        height: buttonheight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: fontsize),
          ),
        ),
      );
    });
  }
}
