import 'package:grabzo/constant/constants.dart';
import 'package:grabzo/model/ItemBean.dart';
import 'package:grabzo/service/Items.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/Theme2/colors.dart';
import 'package:grabzo/pages/CartTab.dart';
import 'package:grabzo/pages/SeeAll.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductInfo extends StatefulWidget {
  ProductInfo({this.id});
  final int id;
  @override
  _ProductInfoState createState() => _ProductInfoState(id);
}

class _ProductInfoState extends State<ProductInfo> {
  _ProductInfoState(this._id);
  int _id;
  var _item;
  int _qty;

  void initState() {
    super.initState();
    _qty = 1;
    _item = Items().getItem(_id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _item,
        builder: (BuildContext context, AsyncSnapshot<ItemBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return _productInfoScaffold(context, snapshot.data);
            }
          }
        });
  }

  Scaffold _productInfoScaffold(BuildContext context, ItemBean data) {
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  //Container(),
                  FadedScaleAnimation(
                    (data.itemImage != null && data.itemImage != "")
                        ? Image.network(Constants.url + data.itemImage,
                            fit: BoxFit.fill)
                        : Image.asset("assets/ProductImages/lady finger.png",
                            fit: BoxFit.fill),
                  ),
                  Positioned.directional(
                      textDirection: Directionality.of(context),
                      top: 40,
                      start: 5,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios))),
                  Positioned.directional(
                      textDirection: Directionality.of(context),
                      top: 40,
                      end: 5,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartTab(),
                              ),
                            );
                          },
                          icon: Icon(Icons.shopping_cart))),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.itemName,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.shopName,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.grey[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        //SizedBox(width: 180,),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                            Constants.rupeesSymbol +
                                " " +
                                data.itemPrice.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20)),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (_qty > 1) {
                                          _qty = _qty - 1;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 16,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.white),
                                child: Text(
                                  _qty.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _qty = _qty + 1;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    // Text(
                    //   "Lorem ipsum dolor sit amet, consectetur dip isicing elit, sed do eiusmod tempor inci didunt ut labore et dolore magna etroaliqua. Ut enim ad minim veniam.",
                    //   softWrap: true,
                    //   style: TextStyle(
                    //     color: Color(0xff585858),
                    //     fontSize: 15,
                    //   ),
                    // ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Items()
                      .addToCart(data.itemId, data.itemPrice, _qty)
                      .then((value) => {
                            if (value)
                              {
                                Fluttertoast.showToast(
                                    msg: "Item added to cart Successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white)
                              }
                            else
                              {
                                Fluttertoast.showToast(
                                    msg: "Error Adding to Cart",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white)
                              }
                          });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: kMainColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "ADD TO CART",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "More By Seller",
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
              ),
              Column(
                children: [
                  // int itm =  6;
                  for (int i = 0; i < 5 / 2; i++)
                    Row(
                      children: [
                        //this
                        for (int j = 0; j < 2; j++)
                          (5 <= i * 2 + j)
                              ? Text("")
                              : Padding(
                                  padding: const EdgeInsets.all(12.0),
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
                                                  alignment:
                                                      Alignment.centerLeft,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  padding: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child: Text('${i * 2 + j}',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF6e6e71),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ),
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: Container(
                                                    height: 28,
                                                    width: 28,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white70,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color(
                                                                0xFFfae3e2),
                                                            blurRadius: 25.0,
                                                            offset: Offset(
                                                                0.0, 0.75),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  padding: EdgeInsets.only(
                                                      left: 5,
                                                      top: 5,
                                                      right: 5),
                                                  child: Text('\$' + '17.30',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF6e6e71),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                        // Padding(
                        //   padding: const EdgeInsets.all(0.0),
                        //   child: Card(
                        //       color: Colors.white,
                        //       elevation: 0,
                        //       // shape: RoundedRectangleBorder(
                        //       //   borderRadius: const BorderRadius.all(
                        //       //     Radius.circular(5.0),
                        //       //   ),
                        //       // ),
                        //       child: Container(
                        //         width: 170,
                        //         height: 210,
                        //         child: Column(
                        //           children: <Widget>[
                        //             Stack(
                        //               children: <Widget>[
                        //                 Align(
                        //                   alignment: Alignment.centerLeft,
                        //                   child: Center(
                        //                       child: Image.asset(
                        //                     'assets/images/popular_foods/ic_popular_food_1.png',
                        //                     width: 130,
                        //                     height: 140,
                        //                   )),
                        //                 )
                        //               ],
                        //             ),
                        //             Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: <Widget>[
                        //                 Container(
                        //                   alignment: Alignment.bottomLeft,
                        //                   padding:
                        //                       EdgeInsets.only(left: 5, top: 5),
                        //                   child: Text('Food Name',
                        //                       style: TextStyle(
                        //                           color: Color(0xFF6e6e71),
                        //                           fontSize: 15,
                        //                           fontWeight: FontWeight.w500)),
                        //                 ),
                        //                 Container(
                        //                   alignment: Alignment.topRight,
                        //                   padding: EdgeInsets.only(right: 5),
                        //                   child: Container(
                        //                     height: 28,
                        //                     width: 28,
                        //                     decoration: BoxDecoration(
                        //                         shape: BoxShape.circle,
                        //                         color: Colors.white70,
                        //                         boxShadow: [
                        //                           BoxShadow(
                        //                             color: Color(0xFFfae3e2),
                        //                             blurRadius: 25.0,
                        //                             offset: Offset(0.0, 0.75),
                        //                           ),
                        //                         ]),
                        //                     child: Icon(
                        //                       Icons.favorite,
                        //                       color: Color(0xfffb3132),
                        //                       size: 16,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: <Widget>[
                        //                 Container(
                        //                   alignment: Alignment.bottomLeft,
                        //                   padding: EdgeInsets.only(
                        //                       left: 5, top: 5, right: 5),
                        //                   child: Text('\$' + '17.30',
                        //                       style: TextStyle(
                        //                           color: Color(0xFF6e6e71),
                        //                           fontSize: 12,
                        //                           fontWeight: FontWeight.w600)),
                        //                 )
                        //               ],
                        //             )
                        //           ],
                        //         ),
                        //       )),
                        // ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
