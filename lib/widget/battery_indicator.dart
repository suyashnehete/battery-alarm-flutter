import 'package:battery_info/enums/charging_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BatteryIndicator extends StatelessWidget {
  final Color color;
  final int batteryLevel;
  final ChargingStatus chargingStatus;

  BatteryIndicator(
      {this.batteryLevel = 25,
      this.color = Colors.black,
      this.chargingStatus = ChargingStatus.Discharging});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 20.sp,
        width: 20.sp * 2.5,
        child: CustomPaint(
          painter: BatteryIndicatorPainter(batteryLevel, color),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 3.sp,
                bottom: 3.sp,
                left: 5.sp,
              ),
              child: chargingStatus == ChargingStatus.Charging
                  ? SvgPicture.asset(
                      "images/flash.svg",
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

class BatteryIndicatorPainter extends CustomPainter {
  int level;
  Color color;

  BatteryIndicatorPainter(this.level, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    double offset = size.height * 0.1;
    var calc = (0.9 - 0.0063 * level);
    canvas.drawRRect(
        RRect.fromLTRBR(
            size.width * calc - offset,
            size.height * 0.05 + offset,
            size.width * 0.9 - offset,
            size.height * 0.95 - offset,
            Radius.circular(size.height * 0.1)),
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);

    canvas.drawRRect(
        RRect.fromLTRBR(8, size.height * 0.25, size.width * 0.17,
            size.height * 0.75, Radius.circular(size.height * 0.1)),
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);

    canvas.drawRRect(
        RRect.fromLTRBR(13, size.height * 0.05, size.width * 0.9,
            size.height * 0.95, Radius.circular(size.height * 0.1)),
        Paint()
          ..color = color
          ..strokeWidth = 0.8
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return (oldDelegate as BatteryIndicatorPainter).level != level ||
        (oldDelegate).color != color;
  }

  get fixedBatteryLv => level < 10 ? 4 + level / 2 : level;
}
