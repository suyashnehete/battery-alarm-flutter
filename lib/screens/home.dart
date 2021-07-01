import 'dart:io';

import 'package:battery_alarm/screens/home_content.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_info/model/iso_battery_info.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey scKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scKey,
      drawer: Drawer(
        child: Center(),
      ),
      body: Builder(
        builder: (context) => Stack(
          children: [
            Platform.isAndroid
                ? StreamBuilder<AndroidBatteryInfo?>(
                    stream: BatteryInfoPlugin().androidBatteryInfoStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return HomeContent(
                          chargingStatus: snapshot.data!.chargingStatus!,
                          batteryLevel: snapshot.data!.batteryLevel!,
                          charging: snapshot.data!.chargeTimeRemaining!,
                          energy: snapshot.data!.remainingEnergy!,
                          health: snapshot.data!.health!,
                          temperature: snapshot.data!.temperature!,
                        );
                      }
                      return Container();
                    },
                  )
                : StreamBuilder<IosBatteryInfo?>(
                    stream: BatteryInfoPlugin().iosBatteryInfoStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return HomeContent(
                          chargingStatus: snapshot.data!.chargingStatus!,
                          batteryLevel: snapshot.data!.batteryLevel!,
                          charging: 0,
                          energy: 0,
                          health: '',
                          temperature: 0,
                        );
                      }
                      return Container();
                    },
                  ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.menu_rounded,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
