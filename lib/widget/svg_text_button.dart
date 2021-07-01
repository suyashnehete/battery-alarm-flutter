import 'package:battery_alarm/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SvgTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String url;
  final bool color;
  final String text;

  SvgTextButton(
      {required this.onPressed,
      required this.url,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                url,
                color: color ? Colors.blue : Colors.grey,
                width: Constants.iconSize,
                height: Constants.iconSize,
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: color ? Colors.blue : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
