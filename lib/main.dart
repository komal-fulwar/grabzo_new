import 'package:flutter/material.dart';

import 'package:flutter_app/pages/CartTab.dart';
import 'package:flutter_app/pages/my_orders.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/SeeAll.dart';
import 'package:flutter_app/pages/SignInPage.dart';
import 'package:flutter_app/pages/SignUpPage.dart';



void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', hintColor: Color( 0xffffffff )),
      home: HomePage(),
    ));
