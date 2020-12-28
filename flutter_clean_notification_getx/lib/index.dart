import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer_util.dart';

import 'core/themes/themes.dart';
import 'view/getx/binding/login_binding.dart';
import 'view/routes/routes.dart';
import 'view/widgets/flavor/flavor_banner.dart';

class AppIndex extends StatelessWidget {
  const AppIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil().init(constraints, orientation);
        return FlavorBanner(
          child: Listener(
            onPointerDown: (_) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.focusedChild.unfocus();
              }
              // Close Keyboard active
            },
            child: GetMaterialApp(
              initialRoute: '/',
              initialBinding: LoginBinding(),
              onGenerateRoute: generateRoute,
              theme: Themes.lightTheme,
            ),
          ),
        );
      });
    });
  }
}
