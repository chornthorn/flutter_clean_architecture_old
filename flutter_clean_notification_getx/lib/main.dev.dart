import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'config/flavors/flavor_config.dart';
import 'config/flavors/flavor_environment.dart';
import 'index.dart';
import 'view/getx/controller/firebase_messaging/firebase_messaging_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(
    FirebaseMessagingController(
      firebaseMessaging: FirebaseMessaging(),
      flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
    ),
  );
  FlavorConfig(
    environment: FlavorEnvironment.DEV,
    name: "DEV",
    color: Colors.red,
    location: BannerLocation.bottomEnd,
    variables: {
      "baseUrl": "https://www.thorn.com",
    },
  );
  print('thorn');
  return runApp(AppIndex());
}
