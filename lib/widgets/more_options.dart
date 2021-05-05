import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {

  final User currentUser;
  final List<List> _moreOptions = [
[MdiIcons.shieldAccount,Colors.deepPurple,"COVID Info center"],
    [MdiIcons.accountMultiple,Colors.cyan,"Friends"],
    [MdiIcons.facebookMessenger,Palette.facebookBlue,"Messenger"],
    [MdiIcons.flag,Colors.orange,"Pages"],
    [MdiIcons.storefront,Colors.deepPurple,"Marketplace"],
    [Icons.ondemand_video,Palette.facebookBlue,"Videos"],
    [Icons.calendar_today_sharp,Colors.red,"Events"]
  ];

   MoreOptionsList({Key key,
    this.currentUser}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: ListView.builder(
        itemCount: 1 + _moreOptions.length,
          itemBuilder: (context,index){
        if(index == 0){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: CachedNetworkImageProvider(
                      currentUser.imageUrl
                  ),
                ),
                SizedBox(width: 10.0,),
                Text("${currentUser.name}")
              ],
            ),
          );
        }
        final option = _moreOptions[index-1];

        return _Option(iconData: option[0],color: option[1],name: option[2],);

      }),
    );
  }
}

class _Option extends StatelessWidget {

  final IconData iconData;
  final Color color;
  final String name;

  const _Option({Key key,
    this.iconData,
    this.color, this.name}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          Icon(iconData,color: color,size: 38.0,),
        SizedBox(width: 6.0,),
        Flexible(
            child: Text(name,
              style: TextStyle(
                fontSize: 16.0
              ),
              overflow: TextOverflow.ellipsis,
            ))


      ],
    );
  }
}

