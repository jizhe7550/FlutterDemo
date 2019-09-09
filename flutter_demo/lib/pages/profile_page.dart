import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/constant.dart' show AppColors;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List menuTitles = [
    'Message',
    'History',
    'Blog',
    'Q&A',
    'Activites',
    'Team',
    'Invite friends',
  ];

  List menuIcons = [
    Icons.message,
    Icons.print,
    Icons.error,
    Icons.phone,
    Icons.send,
    Icons.people,
    Icons.share,
  ];

  String userAvatar;
  String userName;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildHeader();
          }
          index -= 1;
          return ListTile(
            leading: Icon(menuIcons[index]),
            title: Text(
              menuTitles[index],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) {
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
        itemCount: menuTitles.length + 1);
  }

  void _showUserInfo() {}
}

Container _buildHeader() {
  return Container(
    height: 200.0,
    color: Color(AppColors.APP_THEME),
  );
}
