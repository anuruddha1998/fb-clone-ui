import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/contact_list.dart';
import 'package:flutter_facebook_responsive_ui/widgets/create_post_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/more_options.dart';
import 'package:flutter_facebook_responsive_ui/widgets/post_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter_facebook_responsive_ui/widgets/rooms.dart';
import 'package:flutter_facebook_responsive_ui/widgets/stories.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TrackingScrollController _trackingScrollController = TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Responsive(
          mobile: _MobileScreen(scrollController: _trackingScrollController),
          desktop: _DesktopScreen(scrollController: _trackingScrollController),
        ));
  }
}

class _MobileScreen extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _MobileScreen({Key key,
    this.scrollController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            floating: true,
            centerTitle: false,
            actions: [
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[200]),
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
                    shape: BoxShape.circle, color: Colors.grey[200]),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.facebookMessenger,
                  ),
                  color: Colors.black,
                  iconSize: 30.0,
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(
              currentUser: currentUser,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(
                onlineUsers: onlineUsers,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(
              post: post,
            );
          }, childCount: posts.length))
        ],
      ),
    );
  }
}

class _DesktopScreen extends StatelessWidget {


  final TrackingScrollController scrollController;

  const _DesktopScreen({Key key,
    this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser:currentUser),
            ),
          ),
        ),

      Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [

              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: CreatePostContainer(
                  currentUser: currentUser,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(
                    onlineUsers: onlineUsers,
                  ),
                ),
              ),

              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final Post post = posts[index];
                    return PostContainer(
                      post: post,
                    );
                  }, childCount: posts.length))
            ],
          ),
        ),
        Spacer(),

        Align(
          alignment: Alignment.centerRight,
          child: Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: ContactList(users:onlineUsers),
            ),
          ),
        ),


      ],
    );
  }
}

