import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/flavors/flavor_config.dart';

class HomePage extends StatelessWidget {
  final _phoneNumberTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//    var baseUrl = FlavorConfig.instance.variables['baseUrl'];
    var baseUrlPrint = FlavorConfig.instance.toString();
    print(baseUrlPrint);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 100,
          ),
          SizedBox(height: Get.height * 0.05),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: _phoneNumberTextController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Center(
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                'Product Page',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Get.toNamed('/product');
              },
            ),
          ),
          Center(
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                'Character Page',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Get.toNamed('/character');
              },
            ),
          ),
        ],
      ),
    );
  }
}
