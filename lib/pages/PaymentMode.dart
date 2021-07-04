import 'package:Grabzo/pages/ConfirmOrder.dart';
import 'package:animation_wrappers/Animations/faded_translation_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';



class PaymentModePage extends StatefulWidget {

  @override
  _PaymentModePageState createState() => _PaymentModePageState();
}

class _PaymentModePageState extends State<PaymentModePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/header.png',
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
                IconButton(
                    padding: EdgeInsets.only(top: 70),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 70,
                    start: MediaQuery.of(context).size.width / 3.5,
                    child: Text(
                      "paymentMode".toUpperCase(),
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Theme.of(context).scaffoldBackgroundColor),
                    )),
                Positioned.directional(
                  top: 130,
                  width: MediaQuery.of(context).size.width,
                  textDirection: Directionality.of(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      Text(
                        '......',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                      Text(
                        '......',
                        style: TextStyle(fontSize: 40, color: Colors.grey[400]),
                      ),
                      Image.asset(
                        'assets/ic_check.png',
                        height: 22,
                        color: Colors.grey[400],
                      )
                    ],
                  ),
                )
              ],
            ),

            Divider(
              thickness: 0.2,
              height: 8,
            ),
            buildPaymentHead(context," Cash"),
            buildPaymentType(Image.asset('assets/paymentcod.png'),
                "Cash On Delivery"),
            Divider(
              thickness: 0.2,
              height: 8,
            ),

          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Padding buildPaymentHead(BuildContext context, String name) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 28.0, right: 28.0, top: 14, bottom: 4),
      child: Text(
        name,
        style: Theme.of(context).textTheme.subtitle2.copyWith(
            fontSize: 16,
            color: Color(0xffa9a9a9),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildPaymentType(var icon, String name) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmOrderPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
        child: Row(
          children: [
            FadedScaleAnimation(
              CircleAvatar(
                  backgroundColor: Colors.grey[300], radius: 20, child: icon),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
