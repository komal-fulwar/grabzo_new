import 'package:flutter/material.dart';
import 'package:grabzo/pages/CartTab.dart';
import 'package:grabzo/pages/ProfileTab.dart';
import 'package:grabzo/pages/StoreTab.dart';
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
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'
              // title: Text(
              //   'Home',
              //   style: TextStyle(color: Color(0xFF2c2b2b)),
              // ),
              ),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Cart'
              // title: Text(
              //   'Cart',
              //   style: TextStyle(color: Color(0xFF2c2b2b)),
              // ),
              ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user), label: 'Account'
              // title: Text(
              //   'Account',
              //   style: TextStyle(color: Color(0xFF2c2b2b)),
              // ),
              ),
        ],
        selectedItemColor: Color(0xff42950a),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
