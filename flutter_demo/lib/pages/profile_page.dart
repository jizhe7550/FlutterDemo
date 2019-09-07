import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

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
    //show user info
    _showUserInfo();
    //EventBus().on()
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _showUserInfo() {}
}
