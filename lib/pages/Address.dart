import 'package:Grabzo/Theme2/colors.dart';
import 'package:Grabzo/pages/PaymentMode.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Address {
  Address(this.heading, this.address);
  String heading;
  String address;
//  int _radioValue;
}

class AddressPage extends StatefulWidget {


  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
 

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: FadedSlideAnimation(
        Column(
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
                      "select Address".toUpperCase(),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
//                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      Text(
                        '......',
                        style: TextStyle(fontSize: 40, color: Colors.grey[400]),
                      ),
                      Icon(
                        Icons.credit_card,
                        color: Colors.grey[400],
                      ),
                      Text(
                        '......',
                        style: TextStyle(fontSize: 40, color: Colors.grey[400]),
                      ),
                      Image.asset(
                        'assets/ic_check.png',
                        height: 22,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                )
              ],
            ),
            ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Column(

                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "MyAddresses",
                                style: Theme.of(context).textTheme.headline6.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: Color(0xffa9a9a9)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 4),
                                title: Row(
                                  children: [
                                    Text('Home'),
                                    Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline_sharp),
                                      color: Color(0xff686868),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  "1124, Patestine Street, Jackson Tower,\nNear City Garden, New York, USA,",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Spacer(),
            // CustomButton(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => PaymentModePage(),
            //       ),
            //     );
            //   },
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentModePage(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: kMainColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Continue".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
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
}
