import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:intl/intl.dart';

import '../../getx/controller/home_controller/home_controller.dart';

class EmailItemList extends StatefulWidget {
  @override
  _EmailItemListState createState() => _EmailItemListState();
}

class _EmailItemListState extends State<EmailItemList> {
  final DateFormat _dateFormat = DateFormat('MMM dd');

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: GetX<HomeController>(
              builder: (controller) {
                if (controller.isLoading) {
                  return Center(
                    child: CupertinoActivityIndicator.partiallyRevealed(
                      radius: 15,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.messageResEntity.length + 1,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index < controller.messageResEntity.length) {
                      var data = controller.messageResEntity[index];
                      var isKu = index / 2;
                      var isPortrait = MediaQuery.of(context).orientation ==
                          Orientation.portrait;
                      if (isPortrait) {
                        return controller.messageResEntity.length > 0
                            ? Slidable(
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                    caption: 'Read',
                                    color: Colors.grey[300],
                                    icon: Icons.delete,
                                    onTap: () {},
                                  ),
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () {
                                      controller.deleteMessageFun(
                                        messageId: data.messageId,
                                      );
                                    },
                                  ),
                                ],
                                actionPane: SlidableDrawerActionPane(),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: CircleAvatar(
                                              child: Text(
                                                data.messageCircleAvatar ?? "S",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 5,
                                          child: ListTile(
                                            dense: true,
                                            //selected: isKu == 1 ? true : false,
                                            contentPadding: EdgeInsets.zero,
                                            onTap: () {
                                              controller.readMessageFun(
                                                  messageId: data.messageId);
                                              Get.toNamed(
                                                '/email_detail',
                                                arguments: data.messageTitle,
                                              );
                                            },
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '${data.messageSubject}',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  '${data.dateShow}',
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            subtitle: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${data.messageTitle}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${data.messageBody}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                ),
                                              ],
                                            ),
                                            isThreeLine: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Center(
                                child: Text('No have data!'),
                              );
                      }
                      return controller.messageResEntity.length > 0
                          ? Column(
                              children: [
                                SafeArea(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: CircleAvatar(
                                            child: Text(
                                              "S",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 15,
                                        child: ListTile(
                                          dense: true,
                                          selected: isKu == 1 ? true : false,
                                          contentPadding: EdgeInsets.zero,
                                          onTap: () {
                                            controller.readMessageFun(
                                                messageId: data.messageId);
                                            Get.toNamed(
                                              '/email_detail',
                                              arguments: data.messageTitle,
                                            );
                                          },
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${data.messageSubject}',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                '${_dateFormat.format(data.createdDate)}',
                                                style: TextStyle(fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data.messageTitle}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${data.messageBody}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
                                              ),
                                            ],
                                          ),
                                          isThreeLine: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Center(
                              child: Text('No have data!'),
                            );
                    } else if (controller.hasMore) {
                      return Center(
                        child: CupertinoActivityIndicator(
                          radius: 15,
                        ),
                      );
                    } else {
                      return Center(child: Text('No more data!'));
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
