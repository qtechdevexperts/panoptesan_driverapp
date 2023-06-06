import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomeVideoCard extends StatelessWidget {
  String thumpnail;
  String videolink;
  String videodate;

  HomeVideoCard(
      {required this.thumpnail,
      required this.videolink,
      required this.videodate});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  child: Image.network(
                    thumpnail,
                    fit: BoxFit.cover,
                    height: constraint.maxHeight / 1.5,
                    width: constraint.maxWidth,
                  ),
                ),
                CircleVideoButton(
                  onPressed: () {},
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: SquareIconButton(
                    onPressed: () {},
                    icon: Icons.folder,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SquareIconButton(
                    onPressed: () {},
                    icon: Icons.share,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "11/15/12",
                  style: TextStyle(
                      color: Color(0xFF238BBF),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                RoundedBlueButton(
                  buttonText: 'Download',
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      );
    });
  }
}

class RoundedBlueButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const RoundedBlueButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
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
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

class CircleVideoButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CircleVideoButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50.0,
        height: 50.0,
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

class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SquareIconButton({
    required this.icon,
    required this.onPressed,
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
        minimumSize: Size.square(40.0),
        padding: EdgeInsets.zero,
      ),
      child: Icon(
        icon,
        color: Colors.blue,
      ),
    );
  }
}
