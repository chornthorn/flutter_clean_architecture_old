import 'package:flutter/material.dart';

import 'config/flavors/flavor_config.dart';
import 'config/flavors/flavor_environment.dart';
import 'index.dart';

void main() {
  FlavorConfig(
    environment: FlavorEnvironment.UAT,
    name: "UAT",
    color: Colors.deepOrange,
    location: BannerLocation.topStart,
    variables: {
      "baseUrl": "https://www.facebook.com",
    },
  );
  return runApp(AppIndex());
}
