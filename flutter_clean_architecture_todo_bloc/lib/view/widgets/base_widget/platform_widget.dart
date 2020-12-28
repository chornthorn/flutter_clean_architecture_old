import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'base_widget.dart';

class PlatformWidget extends StatelessWidget {
  final Widget Function(BuildContext context) mobile;
  final Widget Function(BuildContext context) tablet;
  final Widget Function(BuildContext context) desktop;
  final Widget Function(BuildContext context) web;

  const PlatformWidget({
    Key key,
    @required this.mobile,
    this.tablet,
    this.desktop,
    this.web,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizeInfo) {
        var deviceType = sizeInfo.deviceType;
        if (deviceType == DeviceScreenType.Mobile) {
          return mobile(context);
        } else if (deviceType == DeviceScreenType.Tablet) {
          return tablet(context) ?? mobile(context);
        } else if (deviceType == DeviceScreenType.Desktop) {
          return desktop(context) ?? web(context);
        } else {
          return mobile(context);
        }
      },
    );
  }
}
