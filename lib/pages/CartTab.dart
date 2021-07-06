import 'package:grabzo/constant/constants.dart';
import 'package:grabzo/model/CartBean.dart';
import 'package:grabzo/pages/AddressPage.dart';
import 'package:grabzo/pages/HomePage.dart';
import 'package:grabzo/service/Items.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/Theme2/colors.dart';

class CartTab extends StatefulWidget {
  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Items().getCart(),
        builder: (BuildContext context, AsyncSnapshot<CartBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              if (snapshot.data == null) {
                return emptyCart();
              } else {
                return cartScaffold(context, snapshot.data);
              }
            }
          }
        });
  }

  Scaffold cartScaffold(BuildContext context, CartBean data) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          elevation: 0,
          title: Text(
            "YOUR CART",
            style: TextStyle(color: kMainTextColor),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadedScaleAnimation(
                                  Image.asset(
                                    "assets/ProductImages/lady finger.png",
                                    height: 95,
                                  ),
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data.cartItems[index].itemName,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // Text(
                                //   items.cartItems[index].category,
                                //   style: Theme.of(context).textTheme.subtitle2,
                                // ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    buildIconButton(Icons.remove, index, data,
                                        data.cartItems[index].cartItemQuantity),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                        '${data.cartItems[index].cartItemQuantity}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    buildIconButton(Icons.add, index, data,
                                        data.cartItems[index].cartItemQuantity),
                                    SizedBox(
                                      width: 40,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(data.cartItems[index].itemPrice.toString(),
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                      );
                    }),
                SizedBox(height: 248),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    // buildAmountRow("Cart Total", '\$ 90.0'),
                    // buildAmountRow("Delivery Fee", '\$ 8.0'),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      // onTap: () => Navigator.popAndPushNamed(
                      //     context, "selectAddress"),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: kMainColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              InkWell(
                                child: Text(
                                  "Checkout Now",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddressPage(data.cartId),
                                    ),
                                  );
                                },
                              ),
                              Spacer(
                                flex: 6,
                              ),
                              InkWell(
                                child: Text("Total",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[100],
                                        fontWeight: FontWeight.w500)),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddressPage(data.cartId),
                                    ),
                                  );
                                },
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                Constants.rupeesSymbol +
                                    " " +
                                    data.cartTotal.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Scaffold emptyCart() {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            elevation: 0,
            title: Text(
              "YOUR CART",
              style: TextStyle(color: kMainTextColor),
            ),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/emptycart.png',
                scale: 3,
              ),
              Text(
                "Your Cart Is Empty",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }

  Padding buildAmountRow(String text, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Container buildIconButton(IconData icon, int index, items, count) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey[400], width: 0)),
      child: IconButton(
        onPressed: () {
          setState(() {
            if (icon == Icons.remove) {
              if (count[index] > 0) count[index]--;
            } else {
              count[index]++;
            }
          });
        },
        icon: Icon(
          icon,
          color: Colors.grey[700],
          size: 16,
        ),
      ),
    );
  }
}
