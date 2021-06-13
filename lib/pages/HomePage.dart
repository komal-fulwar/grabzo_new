import 'package:flutter/material.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/pages/CartTab.dart';
import 'package:flutter_app/pages/ProfileTab.dart';
import 'package:flutter_app/pages/SignInPage.dart';
import 'package:flutter_app/pages/StoreTab.dart';
import 'package:flutter_app/widgets/BestFoodWidget.dart';
import 'package:flutter_app/widgets/BottomNavBarWidget.dart';
import 'package:flutter_app/widgets/PopularFoodsWidget.dart';
import 'package:flutter_app/widgets/SearchWidget.dart';
import 'package:flutter_app/widgets/TopMenus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    StoreTab(),
    CartTab(),
    ProfileTab(),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold (

      body: _children[_currentIndex] , // new
      bottomNavigationBar: BottomNavigationBar (
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped , // new
        currentIndex: _currentIndex , // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(color: Color(0xFF2c2b2b)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            title: Text(
              'Cart',
              style: TextStyle(color: Color(0xFF2c2b2b)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            title: Text(
              'Account',
              style: TextStyle(color: Color(0xFF2c2b2b)),
            ),
          ),
        ] ,
        selectedItemColor: Color( 0xff42950a ),
      ) ,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
