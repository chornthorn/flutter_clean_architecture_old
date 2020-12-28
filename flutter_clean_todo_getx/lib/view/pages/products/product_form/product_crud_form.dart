import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/products/product_list_res_entity.dart';
import '../../../getx/controller/product_controller.dart';

final controller = Get.find<ProductController>();

void buildFormAddProduct() {
  Get.defaultDialog(
    title: 'Add Product',
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
            color: Colors.red,
          ),
          SizedBox(width: 10),
          FlatButton(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => controller.addProductByUser(),
            color: Colors.blue,
          ),
        ],
      )
    ],
    content: Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.productNameTextEditController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.productPriceTextEditController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

void buildFormUpdateProduct(ProductResEntity data) {
  controller.productPriceTextEditController.text = data.productPrice.toString();
  controller.productNameTextEditController.text = data.productName;
  Get.defaultDialog(
    title: 'Update Product',
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
            color: Colors.red,
          ),
          SizedBox(width: 10),
          FlatButton(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => controller.updateProductByUser(data.id),
            color: Colors.blue,
          ),
        ],
      )
    ],
    content: Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.productNameTextEditController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.productPriceTextEditController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

void buildFormDeleteProduct(int id) {
  Get.defaultDialog(
    title: 'Message alert!',
    content: Text('Are you want to delete it?'),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
            color: Colors.red,
          ),
          SizedBox(width: 10),
          FlatButton(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => controller.deleteProductByUser(id),
            color: Colors.blue,
          ),
        ],
      )
    ],
  );
}
