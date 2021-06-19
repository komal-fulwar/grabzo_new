import 'package:flutter/material.dart';
import 'package:Grabzo/animation/ScaleRoute.dart';
import 'package:Grabzo/pages/SignInPage.dart';
import 'package:Grabzo/widgets/BestFoodWidget.dart';
import 'package:Grabzo/widgets/BottomNavBarWidget.dart';
import 'package:Grabzo/widgets/PopularFoodsWidget.dart';
import 'package:Grabzo/widgets/SearchWidget.dart';
import 'package:Grabzo/widgets/TopMenus.dart';

class StoreTab extends StatefulWidget {
  @override
  _StoreTabState createState() => _StoreTabState();
}

class _StoreTabState extends State<StoreTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {
                Navigator.push(context, ScaleRoute(page: SignInPage()));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchWidget(),
            TopMenus(),
            PopularFoodsWidget(),
            PopularFoodsWidget(),

            // BestFoodWidget(),
          ],
        ),
      ),
    );
  }
}
