import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../controller/firebase_messaging/firebase_messaging_controller.dart';

class FirebaseMessagingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseMessagingController>(
      FirebaseMessagingController(
        firebaseMessaging: FirebaseMessaging(),
        flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
      ),
    );
  }
}
