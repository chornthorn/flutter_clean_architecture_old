import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import '../../getx/controller/home_controller/home_controller.dart';

class HomeSearchSection extends StatelessWidget {
  var _priority;
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
        child: GetX<HomeController>(
          builder: (controller) {
            return Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: controller.search,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (text) {
                      controller.searchInputStringFun(text);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: controller.searchInputString.length > 0
                          ? IconButton(
                              icon: Icon(
                                Ionicons.ios_close_circle,
                                color: Colors.grey,
                              ),
                              onPressed: () => controller.queryStringClear(),
                            )
                          : null,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: DropdownButtonFormField(
                      icon: Icon(Icons.arrow_drop_down_circle),
                      iconSize: 22,
                      isDense: true,
                      items: [
                        DropdownMenuItem(
                          value: '',
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'R',
                          child: Text(
                            'Read',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'U',
                          child: Text(
                            'UnRead',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                      onChanged: (value) =>
                          controller.onChangedSearchField(value),
                      value: '',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
