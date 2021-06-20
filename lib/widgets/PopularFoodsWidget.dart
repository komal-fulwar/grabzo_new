import 'package:Grabzo/model/ItemsBean.dart';
import 'package:Grabzo/service/Items.dart';
import 'package:flutter/material.dart';
import 'package:Grabzo/animation/RotationRoute.dart';
import 'package:Grabzo/animation/ScaleRoute.dart';
import 'package:Grabzo/pages/CartTab.dart';

import 'package:Grabzo/pages/ProductInfo.dart';
import 'package:Grabzo/pages/SeeAll.dart';
import 'package:Grabzo/constant/constants.dart';

class PopularFoodsWidget extends StatefulWidget {
  @override
  _PopularFoodsWidgetState createState() => _PopularFoodsWidgetState();
}

class _PopularFoodsWidgetState extends State<PopularFoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          PopularFoodTitle(),
          Expanded(
            child: PopularFoodItems(),
          )
        ],
      ),
    );
  }
}

class PopularFoodTiles extends StatelessWidget {
  String name;
  String imageUrl;

  String price;
  String id;

  PopularFoodTiles(
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
        Navigator.push(context, ScaleRoute(page: ProductInfo()));
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
                            child: Text(name,
                                style: TextStyle(
                                    color: Color(0xFF6e6e71),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          // Container(
                          //   alignment: Alignment.topRight,
                          //   padding: EdgeInsets.only(right: 5),
                          //   child: Container(
                          //     height: 28,
                          //     width: 28,
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: Colors.white70,
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Color(0xFFfae3e2),
                          //             blurRadius: 25.0,
                          //             offset: Offset(0.0, 0.75),
                          //           ),
                          //         ]),
                          //     child: Icon(
                          //       Icons.favorite,
                          //       color: Color(0xfffb3132),
                          //       size: 16,
                          //     ),
                          //   ),
                          // ),
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

class PopularFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Popluar Foods",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xff000000),
                fontWeight: FontWeight.w400),
          ),
          InkWell(
            child: Text(
              "View All",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6e6e71),
                  fontWeight: FontWeight.w100),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeAll(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class PopularFoodItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Items().getAllItems(),
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
                    PopularFoodTiles(
                        name: item.itemName,
                        imageUrl: "ic_popular_food_1",
                        price: item.itemPrice.toString(),
                        id: item.itemId.toString()),
                ],
              );
            }
          }
        });

    //     ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: <Widget>[
    //     PopularFoodTiles(
    //         name: "Fried Egg",
    //         imageUrl: "ic_popular_food_1",
    //         price: '15.06',
    //         id: "0"),
    //     PopularFoodTiles(
    //         name: "Mixed Vegetable",
    //         imageUrl: "ic_popular_food_3",
    //         price: "17.03",
    //         id: "1"),
    //     PopularFoodTiles(
    //         name: "Fried Egg",
    //         imageUrl: "ic_popular_food_1",
    //         price: '15.06',
    //         id: "2"),
    //   ],
    // );
  }
}
