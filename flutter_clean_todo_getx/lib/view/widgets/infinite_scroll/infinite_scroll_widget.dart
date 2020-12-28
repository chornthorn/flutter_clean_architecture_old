import 'package:flutter/material.dart';

/// Copy from package: Lazy load scroll view
enum LoadingStatus { LOADING, STABLE }

class InfiniteScrollWidget extends StatefulWidget {
  final Widget child;
  final int scrollOffset;
  final bool isLoading;

  final Function onNextRequest;

  @override
  State<StatefulWidget> createState() => InfiniteScrollWidgetState();

  InfiniteScrollWidget({
    Key key,
    @required this.child,
    @required this.onNextRequest,
    this.isLoading = false,
    this.scrollOffset = 100,
  })  : assert(onNextRequest != null),
        assert(child != null),
        super(key: key);
}

class InfiniteScrollWidgetState extends State<InfiniteScrollWidget> {
  LoadingStatus loadMoreStatus = LoadingStatus.STABLE;

  @override
  void didUpdateWidget(InfiniteScrollWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isLoading) {
      loadMoreStatus = LoadingStatus.STABLE;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: widget.child,
      onNotification: (notification) => _onNotification(notification, context),
    );
  }

  bool _onNotification(Notification notification, BuildContext context) {
    if (notification is ScrollUpdateNotification) {
      if (notification.metrics.maxScrollExtent > notification.metrics.pixels &&
          notification.metrics.maxScrollExtent - notification.metrics.pixels <=
              widget.scrollOffset) {
        if (loadMoreStatus != null && loadMoreStatus == LoadingStatus.STABLE) {
          loadMoreStatus = LoadingStatus.LOADING;
          widget.onNextRequest();
        }
      }
      return true;
    }
    if (notification is OverscrollNotification) {
      if (notification.overscroll > 0) {
        if (loadMoreStatus != null && loadMoreStatus == LoadingStatus.STABLE) {
          loadMoreStatus = LoadingStatus.LOADING;
          widget.onNextRequest();
        }
      }
      return true;
    }
    return false;
  }
}
