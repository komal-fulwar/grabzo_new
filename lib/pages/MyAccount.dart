import 'package:grabzo/model/ProfilBean.dart';
import 'package:grabzo/pages/EditAddress.dart';
import 'package:grabzo/service/Profile.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/pages/EditProfile.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  var _getProfile;
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
            else
              return scaffold(context, snapshot.data);
          }
        });
  }

  Scaffold scaffold(BuildContext context, ProfileBean data) {
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
                      "My Profile",
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
                      data.name,
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
                      data.email,
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
                      data.phoneNumber.toString(),
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
                    "My Addresses",
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
                          onPressed: () {
                            var method = (null == data.address.street1)
                                ? "put"
                                : "patch";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditAddress(method),
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
