import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'CircleVideoButton.dart';
import 'RoundedBlueButton.dart';
import 'SquareIconButton.dart';

class ProfileHomeWidget extends StatelessWidget {
  dynamic thumpnail;
  String? videolink;
  String? videodate;
  final share;
  final download;
  final archive;
  

  ProfileHomeWidget(
      {required this.thumpnail,
      required this.videolink,
      required this.videodate,
      this.share,
      this.download,
      this.archive});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final borderRadius = BorderRadius.circular(10);
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [


Container(
  padding: EdgeInsets.all(8), // Border width
  decoration: BoxDecoration( borderRadius: borderRadius),
  child: ClipRRect(
    borderRadius: borderRadius,
    child: SizedBox.fromSize(
      size: Size.infinite, // Image radius
      child: Image.network(thumpnail??"", fit: BoxFit.cover),
    ),
  ),
) ,
       
          Positioned(
            top: 5,
            right: 5,
            child: SquareIconButton(
              squareSize: constraint.maxWidth * 0.2,
              onPressed: share,
              icon: Icons.share,
            ),
          )
        ],
      );
    });
  }
}

