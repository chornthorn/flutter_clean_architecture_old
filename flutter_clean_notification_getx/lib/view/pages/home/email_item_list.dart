import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../../domain/entities/messages/message_res_entity.dart';
import '../../getx/controller/home_controller/home_controller.dart';

class EmailItemList extends StatefulWidget {
  @override
  _EmailItemListState createState() => _EmailItemListState();
}

class _EmailItemListState extends State<EmailItemList> {
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
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: controller.messageResEntity.length + 1,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    if (index < controller.messageResEntity.length) {
                      var data = controller.messageResEntity[index];
                      var isPortrait = MediaQuery.of(context).orientation ==
                          Orientation.portrait;
                      if (isPortrait) {
                        if (controller.messageResEntity.length > 0) {
                          return Slidable(
                            secondaryActions: <Widget>[
                              if (data.messageStatus == 'U')
                                IconSlideAction(
                                  caption: 'Read',
                                  color: Colors.grey[300],
                                  icon: Icons.mark_email_read,
                                  onTap: () => controller.onSlideMessage(
                                      data.messageId, 'R'),
                                )
                              else
                                IconSlideAction(
                                  caption: 'UnRead',
                                  color: Colors.grey[300],
                                  icon: Icons.mark_as_unread,
                                  onTap: () => controller.onSlideMessage(
                                      data.messageId, 'U'),
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
                            child: _buildListTilePortrait(data, controller),
                          );
                        } else {
                          return Center(
                            child: Text('No have data!'),
                          );
                        }
                      }
                      if (controller.messageResEntity.length > 0) {
                        return Slidable(
                          secondaryActions: <Widget>[
                            if (data.messageStatus == 'U')
                              IconSlideAction(
                                caption: 'Read',
                                color: Colors.grey[300],
                                icon: Icons.mark_email_read,
                                onTap: () => controller.onSlideMessage(
                                    data.messageId, 'R'),
                              )
                            else
                              IconSlideAction(
                                caption: 'UnRead',
                                color: Colors.grey[300],
                                icon: Icons.mark_as_unread,
                                onTap: () => controller.onSlideMessage(
                                    data.messageId, 'U'),
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
                          child: _buildListTileLandscape(data, controller),
                        );
                      } else {
                        return Center(
                          child: Text('No have data!'),
                        );
                      }
                    } else if (controller.hasMore) {
                      return Center(
                        child: CupertinoActivityIndicator(
                          radius: 15,
                        ),
                      );
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

  Column _buildListTileLandscape(
      MessageResDataEntity data, HomeController controller) {
    return Column(
      children: [
        SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  selected: data.messageStatus == "U" ? true : false,
                  contentPadding: EdgeInsets.zero,
                  onTap: () => controller.onTapListTile(
                      data.messageId, data.messageTitle),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${data.messageSubject}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${data.dateShow}',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  Column _buildListTilePortrait(
      MessageResDataEntity data, HomeController controller) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                selected: data.messageStatus == "U" ? true : false,
                contentPadding: EdgeInsets.zero,
                onTap: () =>
                    controller.onTapListTile(data.messageId, data.messageTitle),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${data.messageSubject}',
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${data.dateShow}',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
      ],
    );
  }
}
