import 'package:grabzo/constant/constants.dart';
import 'package:grabzo/model/ItemsBean.dart';
import 'package:grabzo/service/Items.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/pages/ProductInfo.dart';

class SeeAll extends StatefulWidget {
  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  var _getAllItems;
  void initState() {
    super.initState();
    _getAllItems = Items().getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAllItems,
        builder: (BuildContext context, AsyncSnapshot<ItemsBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return seeAllScaffold(context, snapshot.data);
            }
          }
        });
  }

  Scaffold seeAllScaffold(BuildContext context, ItemsBean data) {
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
          title: Text("All Items",
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
                                  child: (item.itemImage != null &&
                                          item.itemImage != "")
                                      ? Image.network(
                                          Constants.url + item.itemImage,
                                          width: 130,
                                          height: 140)
                                      : Image.asset(
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
