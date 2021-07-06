import 'package:grabzo/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:grabzo/pages/SignInPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  print("ON OPEN Token : $token");
  runApp(MaterialApp(home: token == null ? MyApp() : MyAppLoggedIn()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xffffffff)),
      home: SignInPage(),
    );
  }
}

class MyAppLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xffffffff)),
      home: HomePage(),
    );
  }
}
