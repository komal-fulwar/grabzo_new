import 'package:flutter/material.dart';
import 'package:Grabzo/pages/SignInPage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xffffffff)),
      home: SignInPage(),
    ));
