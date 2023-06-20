import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomeVideoCard extends StatelessWidget {
  String? thumpnail;
  String? videolink;
  String? videodate;
  final share;
  final download;

  HomeVideoCard({
    required this.thumpnail,
    required this.videolink,
    required this.videodate,
    this.share,
    this.download,
  });

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
                    thumpnail ?? "",
                    fit: BoxFit.cover,
                    height: constraint.maxHeight / 1.5,
                    width: constraint.maxWidth,
                  ),
                ),
                CircleVideoButton(
                  height: constraint.maxHeight * 0.25,
                  width: constraint.maxWidth * 0.5,
                  onPressed: () {},
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: SquareIconButton(
                    squareSize: constraint.maxWidth * 0.2,
                    onPressed: () {},
                    icon: Icons.folder,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SquareIconButton(
                    squareSize: constraint.maxWidth * 0.2,
                    onPressed: share,
                    icon: Icons.share,
                  ),
                )
              ],
            ),
            SizedBox(
              height: constraint.maxHeight * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  videodate!,
                  style: TextStyle(
                      color: Color(0xFF238BBF),
                      fontWeight: FontWeight.bold,
                      fontSize: constraint.maxWidth * 0.07),
                ),
                RoundedBlueButton(
                  buttonheight: constraint.maxHeight * 0.125,
                  fontsize: constraint.maxWidth * 0.07,
                  buttonText: 'Download',
                  onPressed: download,
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
