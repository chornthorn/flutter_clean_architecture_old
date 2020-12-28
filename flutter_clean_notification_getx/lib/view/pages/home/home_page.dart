import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/controller/home_controller/home_controller.dart';
import 'email_item_list.dart';
import 'home_search_section.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GetX<HomeController>(builder: (ctr) {
          var lengthItem = ctr.messageResEntity.length;
          return Text(
            lengthItem > 0 ? "กล่องข้อความ ($lengthItem)" : 'กล่องข้อความ',
            style: TextStyle(fontFamily: 'Kanit-Regular'),
          );
        }),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Get.toNamed('/profile'),
          ),
        ],
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification scrollInfo) =>
            controller.onNotification(scrollInfo),
        child: RefreshIndicator(
          onRefresh: () => controller.pullRefreshMessageFun(),
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              HomeSearchSection(),
              EmailItemList(),
            ],
          ),
        ),
      ),
    );
  }
}
