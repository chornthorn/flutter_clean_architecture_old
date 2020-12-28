import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/binding/login_binding.dart';
import '../getx/controller/home_controller/home_controller.dart';
import '../pages/authen/login/login.dart';
import '../pages/home/email_detail_page.dart';
import '../pages/home/home_page.dart';
import '../pages/profiles/profile_page.dart';

//MaterialPageRoute _pageRoute({Widget builder, RouteSettings settings}) =>
//    MaterialPageRoute(builder: (_) => builder, settings: settings);

Route generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      return GetPageRoute(
        routeName: '/',
        page: () => LoginPage(),
        binding: LoginBinding(),
      );
    case '/home':
      return GetPageRoute(
        routeName: '/home',
        page: () => HomePage(),
        binding: HomeBinding(),
      );
    case '/email_detail':
      return GetPageRoute(
        routeName: '/email_detail',
        page: () => EmailDetailPage(
          title: args,
        ),
      );
    case '/profile':
      return GetPageRoute(
        routeName: '/profile',
        page: () => ProfilePage(),
      );
    case '/login':
      return GetPageRoute(
        routeName: '/login',
        page: () => LoginPage(),
      );
  }
  return generateRoute(settings);
}
