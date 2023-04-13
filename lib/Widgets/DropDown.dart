import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final widthh;
  final hinttext;
  final droperlister;
  const CustomDropDown(
      {Key? key,
      required this.widthh,
      required this.hinttext,
      required this.droperlister})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthh,
      child: DropdownButtonFormField(
        icon: Icon(
          Icons.arrow_drop_down_circle,
          size: 24.h,
        ),
        hint: Text(
          hinttext,
          style: TextStyle(color: Color(0xffAFAEAE), fontSize: 14),
        ), // Not necessary for Option 1

        items: ['Option 1', 'Option 2', 'Option 3'].map((category) {
          return DropdownMenuItem(
              value: category,
              child: Text(
                category.toString(),
                style: TextStyle(color: Color(0xffAFAEAE), fontSize: 14),
              ));
        }).toList(),
        onChanged: (newValue) async {},
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Color(0xffAFAEAE), fontSize: 14),

          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          filled: true,
          // hintStyle: TextStyle(color: Color(0xffbdbdbd)),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
            // borderRadius: BorderRadius.all(
            //   Radius.circular(10.0),
            // ),
          ),
        ),
      ),
    );
  }
}
