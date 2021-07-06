import 'package:grabzo/constant/constants.dart';
import 'package:grabzo/model/ShopBean.dart';
import 'package:grabzo/service/Items.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/pages/ProductInfo.dart';

class SeeAllShopItems extends StatefulWidget {
  SeeAllShopItems(this.shopId, this.shopName);
  final int shopId;
  final String shopName;
  @override
  _SeeAllShopItemsState createState() =>
      _SeeAllShopItemsState(shopId, shopName);
}

class _SeeAllShopItemsState extends State<SeeAllShopItems> {
  _SeeAllShopItemsState(this._shopId, this._shopName);
  int _shopId;
  String _shopName;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Items().getAllShopsItems(_shopId),
        builder: (BuildContext context, AsyncSnapshot<ShopBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return seeAllScaffold(context, snapshot.data, _shopName);
            }
          }
        });
  }

  Scaffold seeAllScaffold(
      BuildContext context, ShopBean data, String shopName) {
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
          title: Text(shopName,
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
          for (var item in data.items)
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductInfo(id: item.itemId)));
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
                              child: Text(item.itemName,
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
                              child: Text(
                                  Constants.rupeesSymbol +
                                      item.itemPrice.toString(),
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
