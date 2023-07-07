import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'CircleVideoButton.dart';
import 'RoundedBlueButton.dart';
import 'SquareIconButton.dart';

class HomeVideoCard extends StatelessWidget {
  String? thumpnail;
  String? videolink;
  String? videodate;
  final share;
  final download;
  final archive;
  final archivevisible;
  final midbutton;

  HomeVideoCard(
      {required this.thumpnail,
      required this.videolink,
      required this.videodate,
      this.share,
      this.download,
      this.archive,
      this.archivevisible,
      required this.midbutton});

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
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) {

                      
                      return Center(child: CircularProgressIndicator());
                    },
                    imageUrl: thumpnail!,
                    imageBuilder: (context, imageProvider) => Container(
                      height: constraint.maxHeight / 1.5,
                      width: constraint.maxWidth,
                      decoration: BoxDecoration(
                        //    shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  //  placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      height: constraint.maxHeight / 1.5,
                      width: constraint.maxWidth,
                      
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.error),
                          Text("Thumbnail not available ")
                        ],
                      )),
                  ),
                  // child: Image.network(
                  //   thumpnail ?? "",
                  //   fit: BoxFit.cover,
                  //   height: constraint.maxHeight / 1.5,
                  //   width: constraint.maxWidth,
                  // ),
                ),
                CircleVideoButton(
                  height: constraint.maxHeight * 0.25,
                  width: constraint.maxWidth * 0.5,
                  onPressed: () {
                    midbutton();
                  },
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Visibility(
                    visible:
                        this.archivevisible == null ? true : archivevisible,
                    child: SquareIconButton(
                      squareSize: constraint.maxWidth * 0.2,
                      onPressed: () {
                        archive();
                      },
                      icon: Icons.folder,
                    ),
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
