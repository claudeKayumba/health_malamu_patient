import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({this.widget, this.opacity, this.color});

  final PreferredSize? widget;
  final num? opacity;
  final Color? color;

  @override
  double get minExtent => widget!.preferredSize.height;
  @override
  double get maxExtent => widget!.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      // padding: EdgeInsets.only(top: 10.0),
      // color: Colors.white.withOpacity(this.opacity ?? 0.5),
      color: color ?? Colors.white,
      child: widget,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
