import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/story_model.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';



class Stories extends StatelessWidget {

  final User currentUser;
  final List<Story> stories;

  const Stories({Key key,
   @required this.currentUser,
   @required this.stories
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        itemCount: 1+stories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        if(index == 0){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(isAddStory: true,currentUser: currentUser,));
        }

        Story story = stories[index-1];
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story,)
        );
      }),
    );
  }
}

class _StoryCard extends StatelessWidget {

 final bool isAddStory;
 final User currentUser;
 final Story story;

  const _StoryCard({Key key,
    this.isAddStory =false,
   this.currentUser,
    this.story}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Stack(
         children: [
           
           ClipRRect(
             borderRadius: BorderRadius.circular(12.0),
             child: CachedNetworkImage(
                 imageUrl: isAddStory? currentUser.imageUrl : story.imageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                width: 110,),
           ),
           Container(
             width: 110,
             height: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12.0),
               gradient: Palette.storyGradient
             ),
           ),

           Positioned(
             top: 8.0,
             left: 8.0,
             child: isAddStory? Container(
               width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: Center(
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add),
                  iconSize: 25,
                  color: Palette.facebookBlue,
                ),
              ),
             ):
             ProfileAvatar(imageUrl: story.user.imageUrl,
             hasBorder: !story.isViewed,),
           ),

           Positioned(
             left: 8.0,
               bottom: 8.0,
               child: Text(
             isAddStory? "Add To Story":
                 story.user.name,
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
             ),
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
           ))



         ],
       ),
    );
  }
}

