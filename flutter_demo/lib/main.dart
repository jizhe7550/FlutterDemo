import 'package:flutter/material.dart';

import 'constant/constant.dart' show AppColors;
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(AppColors.APP_THEME),
      ),
      home: HomePage(),
    );
  }
}
