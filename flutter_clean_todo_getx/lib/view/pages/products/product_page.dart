import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/controller/product_controller.dart';
import 'product_form/product_item_list.dart';
import 'product_form/product_search_section.dart';

class ProductPage extends StatelessWidget {
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification scrollInfo) =>
            controller.onNotification(scrollInfo),
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: <Widget>[
            ProductSearchSection(),
            ProductItemList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          controller.productNameTextEditController.clear();
//          controller.productPriceTextEditController.clear();
//          buildFormAddProduct();
//        },
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  checkCondition() {
    if (controller.isLoading) {
      return SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (!controller.isLoading) {
      return ProductItemList();
    }
  }
}
