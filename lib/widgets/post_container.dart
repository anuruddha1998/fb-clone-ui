import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {

  final Post post;

  const PostContainer({
    Key key,
    @required this.post
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ):null,


      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post,),
                  SizedBox(height: 4,),
                  Text(
                      post.caption
                  ),
                  post.imageUrl != null ? SizedBox.shrink() :
                  SizedBox(height: 6,),
                ],
              ),
            ),

           post.imageUrl != null ?
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CachedNetworkImage(
                imageUrl:post.imageUrl
              ),
            ):
             SizedBox.shrink(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostState(post: post,),
            ),

          ],
        ),
      ),
    );
  }


}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, this.post}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
              'assets/lofigirl.jpg'
          ),
        ), //ad network

        SizedBox(width: 8,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: TextStyle(
                  fontWeight: FontWeight.w600
              ),
            ),

            Row(
              children: [
                Text(
                  '${post.timeAgo}',
                  style: TextStyle(
                      color: Colors.grey[600]
                  ),
                ),
                Icon(Icons.public,
                  color: Colors.grey[600],
                  size: 12.0,)

              ],
            )

          ],
        ),

        Spacer(),

        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))

      ],
    );
  }
}

class _PostState extends StatelessWidget {
  final Post post;

  const _PostState({Key key,
   @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      Row(
        children: [

        Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Palette.facebookBlue,
            shape: BoxShape.circle
          ),
          child: Icon(Icons.thumb_up,
          color: Colors.white,
          size: 10.0,),

        ),
         SizedBox(width:4.0),

         Expanded(
           child: Text('${post.likes} Likes',style: TextStyle(
             color: Colors.grey[600]
           ),),
         ),


          Text('${post.comments} Comments',style: TextStyle(
              color: Colors.grey[600]
          ),),

          SizedBox(width: 8.0,),

          Text('${post.shares} Shares',style: TextStyle(
              color: Colors.grey[600]
          ),)

      ],),

      const Divider(),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           _PostButton(icon: Icon(MdiIcons.thumbUpOutline,
           color: Colors.grey[600],size: 20.0,), onTap: (){}, label: "Like"),

        _PostButton(icon: Icon(MdiIcons.commentOutline,
          color: Colors.grey[600],size: 20.0,), onTap: (){}, label: "Comments"),

          _PostButton(icon: Icon(MdiIcons.shareOutline,
            color: Colors.grey[600],size: 20.0,), onTap: (){}, label: "Share"),

        
      ],)


    ],);
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final Function onTap;
  final String label;

  const _PostButton({Key key,
   @required this.icon,
   @required this.onTap,
   @required this.label}) : super(key: key);
  
  
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               icon,
                SizedBox(width: 4.0),
                 Text(label,style: TextStyle(
                   color: Colors.grey[600]
                 ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}






