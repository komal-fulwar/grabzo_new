import 'package:animation_wrappers/Animations/faded_translation_animation.dart';
import 'package:flutter/material.dart';

import 'package:Grabzo/Components/custom_button.dart';
import 'package:Grabzo/Components/entry_field.dart';

import 'package:Grabzo/Theme2/colors.dart';
import 'package:Grabzo/pages/MyProfile.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Text("EDIT PROFILE",
              style: TextStyle(
                color: Color(0xff000000),
              )),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(
              flex: 1,
            ),
            EntryField(
              label: " FullName",
            ),
            EntryField(
              label: "EmailAddress",
            ),
            EntryField(
              label: "PhoneNumber",
            ),
            Spacer(
              flex: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: kMainColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
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
