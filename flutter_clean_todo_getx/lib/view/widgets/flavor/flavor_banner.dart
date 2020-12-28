import 'package:flutter/material.dart';

import '../../../config/flavors/flavor_config.dart';
import '../../../config/flavors/flavor_environment.dart';


class FlavorBanner extends StatelessWidget {
  FlavorBanner({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.instance.environment == FlavorEnvironment.PRD) {
      return child;
    }
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        message: (FlavorConfig.instance.name.isNotEmpty)
            ? FlavorConfig.instance.name
            : FlavorConfig.instance.name.toString().split(".").last,
        location: FlavorConfig.instance.location,
        color: FlavorConfig.instance.color,
        child: child,
      ),
    );
  }
}
