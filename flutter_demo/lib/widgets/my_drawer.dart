import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/about_page.dart';
import 'package:flutter_demo/pages/publish_tweet_page.dart';
import 'package:flutter_demo/pages/settings_page.dart';
import 'package:flutter_demo/pages/tweet_black_room_page.dart';

class MyDrawer extends StatelessWidget {
  final String headImagePath;
  final List menuTitles;
  final List menuIcons;
  static const int PUBLISH_TWEET = 0;
  static const int TWEET_BLACK_ROOM = 1;
  static const int ABOUT = 2;
  static const int SETTINGS = 3;

  MyDrawer(
      {Key key,
      @required this.headImagePath,
      @required this.menuTitles,
      @required this.menuIcons})
      : assert(headImagePath != null),
        assert(menuTitles != null),
        assert(menuIcons != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.zero,
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Image.asset(
                  headImagePath,
                  fit: BoxFit.cover,
                );
              }
              index = index - 1;
              return ListTile(
                  leading: Icon(menuIcons[index]),
                  title: Text(menuTitles[index]),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    switch (index) {
                      case PUBLISH_TWEET:
                        _navPush(context, PublishTweetPage());
                        break;
                      case TWEET_BLACK_ROOM:
                        _navPush(context, TweetBlackRoomPage());
                        break;
                      case ABOUT:
                        _navPush(context, AboutPage());
                        break;
                      case SETTINGS:
                        _navPush(context, SettingsPage());
                        break;
                    }
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Divider(
                  height: 0.0,
                );
              } else {
                return Divider(
                  height: 1.0,
                );
              }
            },
            itemCount: menuTitles.length + 1),
      ),
    );
  }

  _navPush(BuildContext context, Widget page) {
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
