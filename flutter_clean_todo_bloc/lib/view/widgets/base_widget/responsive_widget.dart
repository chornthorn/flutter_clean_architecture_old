import 'package:flutter/material.dart';

import 'base_widget.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget portraitLayout;
  final Widget landscapeLayout;
  const ResponsiveWidget({
    Key key,
    @required this.portraitLayout,
    this.landscapeLayout,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizeInfo) {
        if (sizeInfo.orientation == Orientation.portrait) {
          return portraitLayout;
        } else {
          return landscapeLayout ?? portraitLayout;
        }
      },
    );
  }
}
