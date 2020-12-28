import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../../getx/controller/product_controller.dart';
import 'product_crud_form.dart';

class ProductItemList extends StatefulWidget {
  @override
  _ProductItemListState createState() => _ProductItemListState();
}

class _ProductItemListState extends State<ProductItemList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: GetX<ProductController>(
              builder: (controller) {
                if (controller.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: controller.productResEntity.length + 1,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index < controller.productResEntity.length) {
                      var data = controller.productResEntity[index];
                      return Card(
                        child: ListTile(
                          leading: Text('No. ${data.id}'),
                          title: Text('Name:  ${data.productName}'),
                          trailing: Text(' \$ ${data.productPrice}'),
                          onTap: () => buildFormUpdateProduct(data),
                          onLongPress: () => buildFormDeleteProduct(data.id),
                        ),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
