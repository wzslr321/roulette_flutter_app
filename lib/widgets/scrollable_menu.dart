import 'package:flutter/material.dart';

import '../models/page_view_physics.dart';

class ScrollableMenu extends StatelessWidget {
  final Widget scrollableItem;
  final int itemCount;

  ScrollableMenu(this.scrollableItem, this.itemCount);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return ListView.builder(
        clipBehavior: Clip.antiAlias,
        scrollDirection: Axis.horizontal,
        physics: CustomScrollPhysics(itemDimension: 100),
        itemCount: itemCount,
        itemBuilder: (context, index) => (index == 0 || index == itemCount)
            ? Container(
                padding: EdgeInsets.only(
                  top: queryData.size.height * 0.1,
                  bottom: queryData.size.height * 0.1,
                  left: queryData.size.width * 0.35,
                ),
                child: scrollableItem,
              )
            : index != itemCount
                ? Container(
                    padding: EdgeInsets.only(
                        top: queryData.size.height * 0.1,
                        bottom: queryData.size.height * 0.1,
                        left: queryData.size.width * 0.125,
                        right: queryData.size.width * 0.325),
                    child: scrollableItem)
                : Container(
                    padding: EdgeInsets.only(
                        top: queryData.size.height * 0.1,
                        bottom: queryData.size.height * 0.1,
                        left: queryData.size.width * 0.25,
                        right: queryData.size.width * 0.15),
                    child: scrollableItem,
                  ));
  }
}
