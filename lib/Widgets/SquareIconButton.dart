import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double squareSize;

  const SquareIconButton({
    required this.icon,
    required this.onPressed,
    required this.squareSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        minimumSize: Size.square(squareSize),
        padding: EdgeInsets.zero,
      ),
      child: Icon(
        icon,
        color: Colors.blue,
      ),
    );
  }
}
