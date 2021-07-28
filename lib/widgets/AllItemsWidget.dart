import 'package:grabzo/model/ItemsBean.dart';
import 'package:grabzo/service/Items.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/animation/ScaleRoute.dart';
import 'package:grabzo/pages/ProductInfo.dart';
import 'package:grabzo/pages/SeeAll.dart';
import 'package:grabzo/constant/constants.dart';

class AllItemsWidget extends StatefulWidget {
  @override
  _AllItemsWidgetState createState() => _AllItemsWidgetState();
}

class _AllItemsWidgetState extends State<AllItemsWidget> {
  var _allItems;
  @override
  void initState() {
    super.initState();
    _allItems = Items().getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          ItemsTitle(),
          Expanded(
            child: PopularFoodItems(_allItems),
          )
        ],
      ),
    );
  }
}

class ItemsTiles extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final int id;

  ItemsTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.price,
      @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, ScaleRoute(page: ProductInfo(id: id)));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(boxShadow: [
              /* BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),*/
            ]),
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
                                child: (imageUrl != null && imageUrl != "")
                                    ? Image.network(Constants.url + imageUrl,
                                        width: 130, height: 140)
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
                            child: Text(name,
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
                                Icons.favorite,
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
                            padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                            child: Text(Constants.rupeesSymbol + price,
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

class ItemsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Items",
            style: TextStyle(
                fontSize: 18,
                color: Color(0xff000000),
                fontWeight: FontWeight.w400),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeAll(),
                ),
              );
            },
            child: Text(
              "See More",
              style: TextStyle(color: Color(0xFFBBBBBB)),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularFoodItems extends StatelessWidget {
  final allItems;
  PopularFoodItems(this.allItems);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: allItems,
        builder: (BuildContext context, AsyncSnapshot<ItemsBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (var item in snapshot.data.items)
                    ItemsTiles(
                        name: item.itemName,
                        imageUrl: item.itemImage,
                        price: item.itemPrice.toString(),
                        id: item.itemId),
                ],
              );
            }
          }
        });
  }
}
