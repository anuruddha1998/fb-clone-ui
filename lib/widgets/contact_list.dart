import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';

class ContactList extends StatelessWidget {

  final List<User> users;

  const ContactList({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
        Row(
          children: [
             Text(
               "Contacts",
               style: TextStyle(
                 fontSize: 18.0,
                 fontWeight: FontWeight.w500,
                 color: Colors.grey[600]
               ),
             ),
            Spacer(),

            Icon(Icons.search,
            color: Colors.grey[600],),

            SizedBox(width:8.0),

            Icon(Icons.more_horiz,
              color: Colors.grey[600],),

          ],
        ),
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                itemBuilder: (context,index){
                  User user = users[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage: CachedNetworkImageProvider(
                              user.imageUrl
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Text("${user.name}")

                      ],
                    ),
                  );
                }),
          )

        ],
      ),

    );
  }
}
