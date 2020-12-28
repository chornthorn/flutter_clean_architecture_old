import 'package:flutter/widgets.dart';

import 'device_screen_type.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;

  SizingInformation({
    this.orientation,
    this.deviceType,
    this.screenSize,
  });
  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize ';
  }
}
