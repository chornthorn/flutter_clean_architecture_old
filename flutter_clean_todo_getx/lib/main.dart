import 'package:flutter/material.dart';

import 'config/flavors/flavor_config.dart';
import 'config/flavors/flavor_environment.dart';
import 'index.dart';

void main() {
  FlavorConfig(
    environment: FlavorEnvironment.PRD,
    name: "PROD",
    color: Colors.red,
    location: BannerLocation.bottomEnd,
    variables: {
      "baseUrl": "https://www.facebook.com",
    },
  );
  return runApp(AppIndex());
}
