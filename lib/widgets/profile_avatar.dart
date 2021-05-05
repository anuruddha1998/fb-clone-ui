import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar(
      {Key key,
      @required  this.imageUrl,
        this.isActive=false,
        this.hasBorder=false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        CircleAvatar(
          radius: 20.0,
          child: CircleAvatar(
            radius:hasBorder? 17.0 : 20.0,
            backgroundImage: CachedNetworkImageProvider(
             imageUrl
            ),
          ),
        ),

      isActive?   Positioned(
          top: 25,
            right: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.online,
                border: Border.all(color: Colors.white,width: 2.0)
              ),
            ))
        : const SizedBox.shrink()



      ],
    );
  }
}
