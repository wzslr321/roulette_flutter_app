import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/page_view_physics.dart';

class ScrollableMenu extends StatelessWidget {
  final List<Widget> scrollableItems;
  final EdgeInsets padding;

  final double itemWidth;
  final double itemHeight;

  ScrollableMenu(
      {@required this.scrollableItems,
      @required this.itemWidth,
      this.padding,
      this.itemHeight});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return ListView.builder(
      clipBehavior: Clip.antiAlias,
      scrollDirection: Axis.horizontal,
      physics: CustomScrollPhysics(itemDimension: 100),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
            width: itemWidth,
            margin: padding != null
                ? padding
                : index == 0
                    ? EdgeInsets.only(
                        top: queryData.size.height * 0.1,
                        bottom: queryData.size.height * 0.1,
                        right: (queryData.size.width - itemWidth) / 4,
                        left: (queryData.size.width - itemWidth) / 2)
                    : index == scrollableItems.length - 1
                        ? EdgeInsets.only(
                            top: queryData.size.height * 0.1,
                            bottom: queryData.size.height * 0.1,
                            right: (queryData.size.width - itemWidth) / 2,
                            left: (queryData.size.width - itemWidth) / 4)
                        : EdgeInsets.only(
                            top: queryData.size.height * 0.1,
                            bottom: queryData.size.height * 0.1,),
            child: scrollableItems[index]);
      },
    );
  }
}
