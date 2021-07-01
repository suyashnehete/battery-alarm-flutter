import 'package:battery_info/enums/charging_status.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Constants {
  static double iconSize = 35.sp;

  static String getBatteryHealth(String health) {
    if (health == "heath_good") {
      return "Good";
    } else if (health == "dead") {
      return "Dead";
    } else if (health == "over_heat") {
      return "Over Heated";
    } else if (health == "over_voltage") {
      return "Over Voltage";
    } else if (health == "cold") {
      return "Cold";
    }
    return "Unknown";
  }

  static Color getBatteryHealthColor(String health) {
    if (health == "heath_good" || health == "cold") {
      return Colors.green;
    } else if (health == "over_heat" || health == "over_voltage") {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  static String getChargingTime(
      ChargingStatus status, int energy, int charging) {
    if (status == ChargingStatus.Charging) {
      print(charging);
      return "${(charging / 1000 / 60).abs().toString().split(".")[0]}h ${(charging / 1000 / 60).abs().toStringAsFixed(2).split(".")[1]}m";
    } else if (status == ChargingStatus.Discharging) {
      return "${(energy * 1.0E-9).abs().toString().split(".")[0]}h ${(energy * 1.0E-9).abs().toStringAsFixed(2).split(".")[1]}m";
    }
    return "0h 00m";
  }

  static Color getChargingTimeColor(
      ChargingStatus status, int energy, int charging) {
    if (status == ChargingStatus.Charging) {
      if ((charging / 1000 / 60).abs() >= 5) {
        return Colors.red;
      } else if ((charging / 1000 / 60).abs() >= 3) {
        return Colors.orange;
      }
    } else if (status == ChargingStatus.Discharging) {
      if ((energy * 1.0E-9).abs() <= 0.30) {
        return Colors.red;
      } else if ((energy * 1.0E-9).abs() <= 5) {
        return Colors.orange;
      }
    }
    return Colors.green;
  }
}
