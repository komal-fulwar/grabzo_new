import 'package:grabzo/pages/HomePage.dart';
import 'package:grabzo/service/Profile.dart';
import 'package:grabzo/constant/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _email = new TextEditingController();
    TextEditingController _name = new TextEditingController();
    TextEditingController _number = new TextEditingController();
    TextEditingController _password = new TextEditingController();

    // var locale = AppLocalizations.of(context);
    return Scaffold(
      // drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(
          "Edit Profile",
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
                    Text(
                      "Edit Profile",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Color(0xffa9a9a9)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _name,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
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
                      controller: _email,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
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
                      controller: _number,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
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
                    TextFormField(
                      controller: _password,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                    print('Pressed');
                    Profile()
                        .updateProfile(_name.text, _email.text, _number.text,
                            _password.text)
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
                                      // Navigator.pop(context)
                                    }
                                  : {
                                      //pop up error
                                      Fluttertoast.showToast(
                                          msg: "Wrong Username Or Password",
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
