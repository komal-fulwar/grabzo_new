import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app/Locale/locales.dart';
// import 'package:groshop/Pages/Other/add_review.dart';

class MyOrderItem {
  MyOrderItem(this.img, this.name);
  String img;
  String name;
}

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    List<MyOrderItem> myOrders = [
      MyOrderItem('assets/ProductImages/Layer 1438.png', "locale.jonathanfarms"),
      MyOrderItem('assets/ProductImages/Layer 1439.png', "locale.greencityfarm"),
      MyOrderItem('assets/ProductImages/Garlic.png', "locale.freshGarlic"),
      MyOrderItem('assets/ProductImages/Potatoes.png', "locale.mediumPotatoes"),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
//      drawer: buildDrawer(context),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("myOrders"),
          centerTitle: true,
        ),
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Card(
              elevation: 3,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              color: Colors.white,
              child: Column(
                children: [
                  buildItem(context, 'assets/seller1.png', "Operummarket",
                      '2 items'),
                  ExpansionTile(
                    title:Row(
                      children: [
                        buildGreyColumn(context, "Payment", "price"),
                        Spacer(),
                        buildGreyColumn(context, "OrderStatus", "Dispatched",
                            text2Color: Theme.of(context).primaryColor),
                        Spacer(),

                      ],
                    ),
                    children: <Widget>[
                       Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        buildStatusIcon(Icons.done_all),
                                        Text('------'),
                                        buildStatusIcon(Icons.assignment_returned),
                                        Text('------'),
                                        buildStatusIcon(Icons.directions_bike),
                                        Text('------'),
                                        buildStatusIcon(Icons.navigation),
                                        Text('------'),
                                        buildStatusIcon(Icons.home, disabled: true),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            " placed" + '  ',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "packing",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "dispatched",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "track",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            ' ' + "delivered",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[100],
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "OrderedItems",
                                    style: Theme.of(context).textTheme.subtitle2,
                                  ),
                                  buildAmountRow("FreshRedOnios", '\$14.00'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Qnt. 1',
                                      style: Theme.of(context).textTheme.subtitle2),
                                  Text(
                                    "OrderedItems",
                                    style: Theme.of(context).textTheme.subtitle2,
                                  ),
                                  buildAmountRow("locale.freshLadiesFinger", '\$14.00'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Qnt. 1',
                                      style: Theme.of(context).textTheme.subtitle2),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, bottom: 10, top: 5),
                              child: Column(
                                children: [
                                  buildAmountRow("locale.deliveryFee", '\$4.50'),
                                  buildAmountRow("locale.promoCode", '-\$2.00'),
                                  buildAmountRow("locale.amountToPay", '\$30.50',
                                      fontWeight: FontWeight.w700),
                                ],
                              ),
                            )
                          ],
                        ),



                    ],
                  ),


                ],
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

  CircleAvatar buildStatusIcon(IconData icon, {bool disabled = false}) =>
      CircleAvatar(
          backgroundColor: !disabled ? Color(0xff222e3e) : Colors.grey[300],
          child: Icon(
            icon,
            size: 20,
            color: !disabled
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
          ));


  }



  Padding buildItem(
      BuildContext context, String img, String name, String category) {
    // var locale = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    img,
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  )),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    category,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 16),
                  Text("OrderedOn" +' '+ ' 23 Jun, 11:40',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 10.5)),
                ],
              ),
            ],
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: 0,
            bottom: 0,
            child: Text(
              "orderID" + ' 2254126',
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontSize: 10.5),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildAmountRow(String name, String price,
      {FontWeight fontWeight = FontWeight.w500}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: fontWeight),
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }

  Column buildGreyColumn(BuildContext context, String text1, String text2,
      {Color text2Color = Colors.black}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,
            style:
            Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 11)),
        SizedBox(height: 8),
        LimitedBox(
          maxWidth: 100,
          child: Text(text2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: text2Color)),
        ),
      ],
    );
  }

