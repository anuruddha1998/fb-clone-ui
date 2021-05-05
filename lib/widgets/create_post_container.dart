
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';

class CreatePostContainer extends StatelessWidget {

  final User currentUser;

  const CreatePostContainer({Key key,
   @required this.currentUser}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ):null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              Row(
                children: [

                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage(
                     'assets/lofigirl.jpg',
                    ),
                  ),
                  const SizedBox(width:8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Whats\' on your mind?",
                        hintStyle: TextStyle(
                          color: Colors.black
                        )
                      ),
                    ),
                  )

                ],
              ),
            const  Divider(height: 10.0,thickness: 0.5,),

              Container(
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

            FlatButton.icon(onPressed: (){},
                  icon: Icon(Icons.videocam,color: Colors.red,),
                  label: Text(
                    "Live"
                  )),
                    VerticalDivider(width: 8.0,),

                    FlatButton.icon(onPressed: (){},
                        icon: Icon(Icons.photo_library,color: Colors.green,),
                        label: Text(
                            "Photo"
                        )),

                    VerticalDivider(width: 8.0,),

                    FlatButton.icon(onPressed: (){},
                        icon: Icon(Icons.video_call,color: Colors.purpleAccent,),
                        label: Text(
                            "Room"
                        )),


                  ],
                ),
              )




            ],
          ),
        ),
      ),
    );
  }
}
