import 'package:flutter/material.dart';
class CircleVideoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;

  const CircleVideoButton(
      {required this.onPressed, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        child: Icon(
          Icons.video_library,
          color: Colors.white,
        ),
      ),
    );
  }
}