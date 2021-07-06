import 'package:grabzo/Theme2/colors.dart';
import 'package:grabzo/model/ProfilBean.dart';
import 'package:grabzo/pages/EditAddress.dart';
import 'package:grabzo/pages/PaymentMode.dart';
import 'package:grabzo/service/Profile.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddressPage extends StatefulWidget {
  AddressPage(this.cartId);
  final int cartId;
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var _getProfile;
  @override
  void initState() {
    super.initState();
    _getProfile = Profile().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getProfile,
        builder: (BuildContext context, AsyncSnapshot<ProfileBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return addressPageScaffold(context, snapshot.data);
            }
          }
        });
    // return addressPageScaffold(context);
  }

  Scaffold addressPageScaffold(BuildContext context, ProfileBean data) {
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
                                "My Address",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        color: Color(0xffa9a9a9)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 4),
                                title: Row(
                                  children: [
                                    Text('Home'),
                                    Spacer(),
                                    IconButton(
                                      icon: const Icon(
                                          Icons.add_circle_outline_sharp),
                                      color: Color(0xff686868),
                                      onPressed: () {
                                        var method =
                                            (null == data.address.street1)
                                                ? "put"
                                                : "patch";
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditAddress(method),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  (null == data.address.street1)
                                      ? "No Address"
                                      : "${data.address.street1}, ${data.address.street2}, \n${data.address.landmark}, ${data.address.city} ${data.address.state}, ${data.address.country}, ${data.address.pin}",
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
                if (null == data.address.street1) {
                  Fluttertoast.showToast(
                      msg: "Address Cannot be empty",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentModePage(widget.cartId),
                    ),
                  );
                }
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
