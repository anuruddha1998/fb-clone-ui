import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;
  final bool isBottomIndicator;

  const CustomTabBar(
      {Key key,
      @required this.icons,
      @required this.selectedIndex,
      @required this.onTap,
        this.isBottomIndicator =  false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    size: 30.0,
                    color: i == selectedIndex? Palette.facebookBlue : Colors.black45,
                  ),
                )),
          )
          .values
          .toList(),
      onTap: onTap,
      indicator: BoxDecoration(
          border:
             isBottomIndicator ?
             Border(
                 bottom: BorderSide(color: Palette.facebookBlue, width: 3.0))
                 :
             Border(
                 top: BorderSide(color: Palette.facebookBlue, width: 3.0))

      ),
      indicatorPadding: EdgeInsets.zero,
    );
  }
}
