import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../getx/controller/product_controller.dart';

class ProductSearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: GetX<ProductController>(
          builder: (controller) {
            return TextField(
              controller: controller.search,
              textInputAction: TextInputAction.search,
              textCapitalization: TextCapitalization.words,
              onChanged: (text) {
                controller.searchInputStringFun(text);
              },
              //onSubmitted: (val) => controller.searchData(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: controller.searchInputString.length > 0
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                        onPressed: () => controller.queryStringClear(),
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
