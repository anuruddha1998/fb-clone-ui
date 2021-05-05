import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/customTab_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {

final User currentUser;
final List<IconData> icons;
int selectedIndex;
final Function onTap;

   CustomAppBar({Key key,
   @required this.currentUser,
   @required this.icons,
   @required this.selectedIndex,
   @required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,2),
            blurRadius: 4.0
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //fb icon
          Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),

          //tab bar
          Container(
            width: 600.0,
            height: double.infinity,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap:onTap,
              isBottomIndicator: true,
            ),
          ),

          //action icons
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage(
                    'assets/lofigirl.jpg',
                  ),
                ),
              SizedBox(width: 6.0,),
              Text(
                currentUser.name,
                style:  TextStyle(
                    color: Colors.black,
                  fontSize: 16.0
                ),
              ),
                SizedBox(width: 12.0,),

              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200]
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                  color: Colors.black,
                  iconSize: 30.0,
                ),
              ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200]
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      MdiIcons.facebookMessenger,
                    ),
                    color: Colors.black,
                    iconSize: 30.0,
                  ),
                )


            ],),
          )


        ],
      ),
    );
  }
}
