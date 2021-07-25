import 'package:grabzo/Theme2/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/constant/constants.dart';
import 'package:grabzo/model/Orders.dart';
import 'package:grabzo/model/OrdersBean.dart';
import 'package:grabzo/service/Profile.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  var _getOrder;
  void initState() {
    super.initState();
    _getOrder = Profile().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getOrder,
        builder: (BuildContext context, AsyncSnapshot<OrdersBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return orderScaffold(context, snapshot.data);
            }
          }
        });
  }

  Scaffold orderScaffold(BuildContext context, OrdersBean data) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "My Orders",
            style: TextStyle(color: kMainTextColor),
          ),
          centerTitle: true,
        ),
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            for (var orders in data.orders)
              Card(
                elevation: 3,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                color: Colors.white,
                child: Column(
                  children: [
                    orderHeader(context, orders),
                    ExpansionTile(
                      title: Row(
                        children: [
                          buildGreyColumn(context, "Payment",
                              "${Constants.rupeesSymbol} ${orders.orderTotal}"),
                          Spacer(),
                          buildGreyColumn(
                              context,
                              "OrderStatus",
                              (orders.orderStatus == 0)
                                  ? "Placed"
                                  : (orders.orderStatus == 1)
                                      ? "Packing"
                                      : "Dispatched",
                              text2Color: Color(0xFF39c526)),
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
                                child: orderStatus(orders),
                              ),
                            ),
                            Container(
                              color: Colors.grey[100],
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // for (var items in orders.orderItems)

                                  buildAmountRow("FreshRedOnios", '\$14.00'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Qnt. 1',
                                      style:
                                          Theme.of(context).textTheme.subtitle2)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, bottom: 10, top: 5),
                              child: Column(
                                children: [
                                  buildAmountRow("DeliveryFee",
                                      '${Constants.rupeesSymbol} ${orders.orderDelivery}'),
                                  buildAmountRow("AmountToPay",
                                      '${Constants.rupeesSymbol} ${orders.orderTotal}',
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

  Column orderStatus(Orders orders) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildStatusIcon(Icons.done_all),
            Text('------'),
            buildStatusIcon(Icons.assignment_returned,
                disabled: (orders.orderStatus >= 1) ? false : true),
            Text('------'),
            buildStatusIcon(Icons.directions_bike,
                disabled: (orders.orderStatus >= 2) ? false : true),
            // Text('------'),
            // buildStatusIcon(Icons.navigation),
            Text('------'),
            buildStatusIcon(Icons.home,
                disabled: (orders.orderStatus >= 3) ? false : true),
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
              // Text(
              //   "track",
              //   style: TextStyle(fontSize: 12),
              // ),
              Text(
                ' ' + "delivered",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  CircleAvatar buildStatusIcon(IconData icon, {bool disabled = false}) =>
      CircleAvatar(
          backgroundColor: !disabled ? Color(0xff222e3e) : Colors.grey[300],
          child: Icon(
            icon,
            size: 20,
            color: !disabled
                ? Color(0xFF39c526)
                : Theme.of(context).scaffoldBackgroundColor,
          ));
}

Padding orderHeader(BuildContext context, Orders orders) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // ClipRRect(
            //     borderRadius: BorderRadius.circular(10),
            //     child: Image.asset(
            //       img,
            //       height: 70,
            //       width: 70,
            //       fit: BoxFit.fill,
            //     )),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Order Id : ${orders.orderId}",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 6),
                Text(
                  "${orders.orderCount} Items",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(height: 16),
                Text("OrderedOn ${orders.orderDatetime}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontSize: 13)),
              ],
            ),
          ],
        ),
        // Positioned.directional(
        //   textDirection: Directionality.of(context),
        //   end: 0,
        //   bottom: 0,
        //   child: Text(
        //     "orderID" + ' 2254126',
        //     textAlign: TextAlign.right,
        //     style:
        //         Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 10.5),
        //   ),
        // ),
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
          style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 11)),
      SizedBox(height: 8),
      LimitedBox(
        maxWidth: 100,
        child: Text(text2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: text2Color)),
      ),
    ],
  );
}
