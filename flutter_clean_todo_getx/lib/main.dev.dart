import 'package:flutter/material.dart';

import 'config/flavors/flavor_config.dart';
import 'config/flavors/flavor_environment.dart';
import 'index.dart';

void main() {
  FlavorConfig(
    environment: FlavorEnvironment.DEV,
    name: "DEV",
    color: Colors.red,
    location: BannerLocation.bottomEnd,
    variables: {
      "baseUrl": "https://www.thorn.com",
    },
  );
  return runApp(AppIndex());
}
