import 'dart:io';

import 'package:battery_alarm/helper/constants.dart';
import 'package:battery_alarm/widget/circular_battery_indicator.dart';
import 'package:battery_alarm/widget/home_background.dart';
import 'package:battery_alarm/widget/svg_text_button.dart';
import 'package:battery_alarm/widget/text_icon.dart';
import 'package:battery_info/enums/charging_status.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class HomeContent extends StatefulWidget {
  final int batteryLevel;
  final ChargingStatus chargingStatus;
  final int temperature;
  final int energy;
  final int charging;
  final String health;

  HomeContent(
      {required this.batteryLevel,
      required this.chargingStatus,
      required this.temperature,
      required this.energy,
      required this.charging,
      required this.health});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isAlarm = false;
  bool isThief = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: CustomPaint(
            painter: HomeBackground(),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: CircularPercentIndicator(
                      percent: widget.batteryLevel / 100,
                      radius: 200.sp,
                      lineWidth: 3.sp,
                      chargingStatus: widget.chargingStatus,
                    ),
                  ),
                  Platform.isAndroid
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextIcon(
                                icon: FaIcon(
                                  widget.temperature < 50
                                      ? FontAwesomeIcons
                                          .thermometerThreeQuarters
                                      : FontAwesomeIcons.thermometerFull,
                                  color: widget.temperature < 40
                                      ? Colors.green
                                      : widget.temperature < 50
                                          ? Colors.orange
                                          : Colors.red,
                                ),
                                text: "${widget.temperature} \u2103",
                              ),
                              TextIcon(
                                icon: FaIcon(
                                  FontAwesomeIcons.solidClock,
                                  color: Constants.getChargingTimeColor(
                                      widget.chargingStatus,
                                      widget.energy,
                                      widget.charging),
                                ),
                                text: Constants.getChargingTime(
                                    widget.chargingStatus,
                                    widget.energy,
                                    widget.charging),
                              ),
                              TextIcon(
                                icon: FaIcon(
                                  FontAwesomeIcons.heartbeat,
                                  color: Constants.getBatteryHealthColor(
                                      widget.health),
                                ),
                                text:
                                    "${Constants.getBatteryHealth(widget.health)}",
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              SvgTextButton(
                onPressed: () {
                  setState(() {
                    isAlarm = !isAlarm;
                  });
                },
                url: "images/alarm.svg",
                color: isAlarm,
                text: "Battery Alarm",
              ),
              Center(
                child: Container(
                  color: Colors.grey,
                  width: 2.sp,
                  height: Constants.iconSize * 2,
                ),
              ),
              SvgTextButton(
                onPressed: () {
                  setState(() {
                    isThief = !isThief;
                  });
                },
                url: "images/thief.svg",
                color: isThief,
                text: "Thief Alarm",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
