import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextIcon extends StatelessWidget {
  final Widget icon;
  final String text;

  TextIcon({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 5.sp,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
