import 'package:grabzo/pages/HomePage.dart';
import 'package:grabzo/service/Profile.dart';
import 'package:grabzo/constant/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditAddress extends StatefulWidget {
  EditAddress(this.method);
  final String method;
  @override
  _EditAddressState createState() => _EditAddressState(method);
}

class _EditAddressState extends State<EditAddress> {
  _EditAddressState(this._method);
  String _method;
  @override
  Widget build(BuildContext context) {
    TextEditingController _street1 = new TextEditingController();
    TextEditingController _street2 = new TextEditingController();
    TextEditingController _landmark = new TextEditingController();
    TextEditingController _city = new TextEditingController();
    TextEditingController _state = new TextEditingController();
    TextEditingController _country = new TextEditingController();
    TextEditingController _pin = new TextEditingController();

    // var locale = AppLocalizations.of(context);
    return Scaffold(
      // drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(
          "Edit Address",
        ),
        leading: BackButton(
          color: darkText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: FadedSlideAnimation(
        ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   "Edit Profile",
                    //   style: Theme.of(context).textTheme.headline6.copyWith(
                    //       fontSize: 16,
                    //       letterSpacing: 1,
                    //       color: Color(0xffa9a9a9)),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _street1,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Street 1',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: highlightColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _street2,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Street 2',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: highlightColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _landmark,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Landmark',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: highlightColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _city,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'City',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: highlightColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _state,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'State',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: highlightColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _country,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Country',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: highlightColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _pin,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Pincode',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: highlightColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: Text('Save Changes'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {
                    Profile()
                        .updateAddress(
                            _street1.text,
                            _street2.text,
                            _landmark.text,
                            _city.text,
                            _state.text,
                            _country.text,
                            _pin.text,
                            _method)
                        .then((value) => {
                              value
                                  ? {
                                      Fluttertoast.showToast(
                                          msg: "Details Updated",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white),
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                      )
                                    }
                                  : {
                                      Fluttertoast.showToast(
                                          msg: "Error Updating Address",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white)
                                    }
                            });
                  },
                )
              ],
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

// ListTile buildAddressTile(String heading, String address) {
//   return ListTile(
//     contentPadding: EdgeInsets.symmetric(horizontal: 4),
//     title: Row(
//       children: [
//         Text(heading),
//         Spacer(),
//         Icon(
//           Icons.edit,
//           color: Color(0xff686868),
//           size: 20,
//         ),
//       ],
//     ),
//     subtitle: Text(
//       address,
//       style: TextStyle(fontSize: 14),
//     ),
//   );
// }
}
