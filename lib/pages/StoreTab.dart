import 'package:grabzo/pages/Shops.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/animation/ScaleRoute.dart';
import 'package:grabzo/pages/SignInPage.dart';
import 'package:grabzo/widgets/AllItemsWidget.dart';
import 'package:grabzo/widgets/SearchWidget.dart';
import 'package:grabzo/widgets/Categories.dart';

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
            Catgories(),
            Shops(),
            Divider(
              color: Colors.white,
            ),
            AllItemsWidget(),
          ],
        ),
      ),
    );
  }
}
