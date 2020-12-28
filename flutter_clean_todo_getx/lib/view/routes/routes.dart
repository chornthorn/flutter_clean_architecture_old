import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_point/view/getx/bindings/product_binding.dart';

import '../pages/home/home.dart';
import '../pages/products/product_page.dart';

//MaterialPageRoute _pageRoute({Widget builder, RouteSettings settings}) =>
//    MaterialPageRoute(builder: (_) => builder, settings: settings);

Route generateRoute(RouteSettings settings) {
//  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      return GetPageRoute(
        routeName: '/',
        page: () => HomePage(),
      );
    case '/product':
      return GetPageRoute(
        routeName: '/product',
        page: () => ProductPage(),
        binding: ProductBinding(),
      );
  }
  return generateRoute(settings);
}
