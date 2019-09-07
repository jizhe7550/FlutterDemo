import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/my_drawer.dart';
import 'package:flutter_demo/widgets/navigation_icon_view.dart';

import 'constant/constant.dart' show AppColors;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBarTitle = ['News', 'Tweets', 'Find', 'Profile'];
  List<NavigationIconView> _navigationIconViews;
  var _currentIndex = 0;
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _navigationIconViews = [
      NavigationIconView(
          title: 'News',
          iconPath: 'assets/images/ic_nav_news_normal.png',
          activeIconPath: 'assets/images/ic_nav_news_actived.png'),
      NavigationIconView(
          title: 'Tweets',
          iconPath: 'assets/images/ic_nav_tweet_normal.png',
          activeIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(
          title: 'Find',
          iconPath: 'assets/images/ic_nav_discover_normal.png',
          activeIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(
          title: 'Profile',
          iconPath: 'assets/images/ic_nav_my_normal.png',
          activeIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];

    _pages = [
      Container(color: Color(0xffff0000)),
      Container(color: Color(0xffffda00)),
      Container(color: Color(0xffff0fe0)),
      Container(color: Color(0xffff430a))
    ];

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    //SafeArea use for adapting different shapes of screens
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter',
            style: TextStyle(color: Color(AppColors.APP_BAR))),
        iconTheme: IconThemeData(color: Color(AppColors.APP_BAR)),
      ),
      body: PageView.builder(
        //physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _navigationIconViews.map((view) => view.item).toList(),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 1), curve: Curves.ease);
        },
      ),
      drawer: MyDrawer(
          headImagePath: 'assets/images/cover_img.jpg',
          menuTitles: ['Publish tweet', 'Tweet room', 'About', 'Settings'],
          menuIcons: [Icons.send, Icons.home, Icons.error, Icons.settings]),
    );
  }
}
