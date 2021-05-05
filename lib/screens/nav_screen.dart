import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/widgets/customAppBAr.dart';
import 'package:flutter_facebook_responsive_ui/widgets/customTab_bar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}


class _NavScreenState extends State<NavScreen> {

  final List<Widget> screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  int selectedTab  = 0;


  @override
  Widget build(BuildContext context) {
final Size screenSize = MediaQuery.of(context).size;


    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
      body: IndexedStack(
        children: screens,
        index: selectedTab,
      ),
        appBar: Responsive.isDesktop(context) ?
        PreferredSize(
            child: CustomAppBar(
              currentUser: currentUser,
              icons: icons,
              selectedIndex: selectedTab,
              onTap: (index){
                setState(() {
                  selectedTab = index;
                });
              },
            ),
            preferredSize: Size(screenSize.width,100.0),
        ):null,
        bottomNavigationBar: !Responsive.isDesktop(context) ? Container( //if not desktop return bottom navigation bar
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedTab,
            onTap: (index){
            setState(() {
              selectedTab = index;
            });
            },
          ),
        ):SizedBox.shrink(),



      ),
    );
  }
}
