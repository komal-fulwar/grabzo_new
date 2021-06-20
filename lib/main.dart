import 'package:flutter/material.dart';

import 'package:Grabzo/pages/CartTab.dart';
import 'package:Grabzo/pages/my_orders.dart';
import 'package:Grabzo/pages/HomePage.dart';
import 'package:Grabzo/pages/SeeAll.dart';
import 'package:Grabzo/pages/SignInPage.dart';
import 'package:Grabzo/pages/SignUpPage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xffffffff)),
      home: SignInPage(),
    ));
