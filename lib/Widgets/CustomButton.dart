import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';

class CustomButton extends StatefulWidget {
  String ButtonText;
  double width;
  final VoidCallback? tap;
  double? height;
  var colors;
  var gradients;
  var textColor;

  CustomButton({
    Key? key,
    this.textColor,
    this.gradients,
    this.colors,
    this.height,
    this.tap,
    required this.width,
    required this.ButtonText,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.tap!(),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.colors,
          borderRadius: BorderRadius.circular(5),
          gradient: widget.gradients,
        ),
        child: Center(
          child: Text(
            widget.ButtonText,
            style: GoogleFonts.inter(fontSize: 18, color: widget.textColor, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
