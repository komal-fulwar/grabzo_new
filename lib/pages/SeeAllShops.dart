import 'package:Grabzo/model/ItemsBean.dart';
import 'package:Grabzo/model/ShopsBean.dart';
import 'package:Grabzo/service/Items.dart';
import 'package:flutter/material.dart';
import 'package:Grabzo/animation/RotationRoute.dart';
import 'package:Grabzo/animation/ScaleRoute.dart';
import 'package:Grabzo/pages/CartTab.dart';
import 'package:Grabzo/pages/ProductInfo.dart';
import 'package:Grabzo/pages/SeeAll.dart';

class SeeAllShops extends StatefulWidget {
  @override
  _SeeAllShopsState createState() => _SeeAllShopsState();
}

class _SeeAllShopsState extends State<SeeAllShops> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Items().getAllShops(),
        builder: (BuildContext context, AsyncSnapshot<ShopsBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return seeAllShopsScaffold(context, snapshot.data);
            }
          }
        });
  }

  Scaffold seeAllShopsScaffold(BuildContext context, ShopsBean data) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Text("All Shops",
              style: TextStyle(
                color: Color(0xff000000),
              )),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        children: <Widget>[
          for (var shop in data.shops)
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductInfo(id: shop.shopId)));
              },
              child: Card(
                  color: Colors.white,
                  elevation: 0,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: const BorderRadius.all(
                  //     Radius.circular(5.0),
                  //   ),
                  // ),
                  child: Container(
                    width: 170,
                    height: 210,
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Center(
                                  child: Image.asset(
                                'assets/images/popular_foods/ic_popular_food_1.png',
                                width: 130,
                                height: 140,
                              )),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Text(shop.shopName,
                                  style: TextStyle(
                                      color: Color(0xFF6e6e71),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.only(right: 5),
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFfae3e2),
                                        blurRadius: 25.0,
                                        offset: Offset(0.0, 0.75),
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.near_me_outlined,
                                  color: Color(0xfffb3132),
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.bottomLeft,
                              padding:
                                  EdgeInsets.only(left: 5, top: 5, right: 5),
                              child: Text(shop.aboutShop,
                                  style: TextStyle(
                                      color: Color(0xFF6e6e71),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
        ],
      ),
    );
  }
}
