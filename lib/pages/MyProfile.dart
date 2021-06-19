import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:Grabzo/Components/custom_button.dart';
import 'package:Grabzo/Components/drawer.dart';
import 'package:Grabzo/Components/entry_field.dart';
import 'package:Grabzo/Theme2/colors.dart';
import 'package:Grabzo/pages/EditProfile.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
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
          title: Text("MY PROFILE",
              style: TextStyle(
                color: Color(0xff000000),
              )),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      "MyProfile",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 17,
                          letterSpacing: 1,
                          color: Color(0xffa9a9a9)),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      color: Color(0xff686868),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      "Full Name",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15, letterSpacing: 1, color: Colors.black),
                    ),
                    subtitle: Text(
                      'NAME',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16, letterSpacing: 1, color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Email Address",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15, letterSpacing: 1, color: Colors.black),
                    ),
                    subtitle: Text(
                      'MAIL',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16, letterSpacing: 1, color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Phone",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15, letterSpacing: 1, color: Colors.black),
                    ),
                    subtitle: Text(
                      'NUMBER',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16, letterSpacing: 1, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[100],
              thickness: 10,
              height: 40,
            ),
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
                          icon: const Icon(Icons.edit),
                          color: Color(0xff686868),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '1124, Patestine Street, Jackson Tower,\nNear City Garden, New York, USA',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // CustomButton(
            //   label: "AddAddress".toUpperCase(),
            //   // onPress: AddAddressPage(),
            // ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
