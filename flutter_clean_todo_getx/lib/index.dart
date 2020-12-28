import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/pages/home/home.dart';
import 'view/routes/routes.dart';
import 'view/widgets/flavor/flavor_banner.dart';

class AppIndex extends StatelessWidget {
  const AppIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: GetMaterialApp(
          home: HomePage(),
          initialRoute: '/',
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
