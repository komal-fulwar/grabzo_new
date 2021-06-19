import 'package:flutter/material.dart';
// import 'package:flutter_app/Drawer/contact_us.dart';

// import 'package:flutter_app/Drawer/select_language.dart';
import 'package:Grabzo/Pages/Login/sign_up.dart';
import 'package:Grabzo/Pages/Other/add_address.dart';
import 'package:Grabzo/Pages/Other/edit_item.dart';
import 'package:Grabzo/Pages/Other/reviews.dart';
import 'package:Grabzo/Pages/Other/send_to_bank.dart';

class PageRoutes {
  static const String signUp = 'sign_up';
  static const String newOrdersDrawer = 'new_orders_drawer';
  static const String editItem = 'edit_item';
  static const String reviewsPage = 'reviews_page';
  static const String sendToBank = 'send_to_bank';
  static const String addAddress = 'add_address';
  static const String insight = 'insight';
  static const String myItemsPage = 'my_item_page';
  static const String myEarnings = 'my_earnings';
  static const String myProfile = 'my_profile';
  static const String contactUs = 'contact_us';
  static const String chooseLanguage = 'choose_language';

  Map<String, WidgetBuilder> routes() {
    return {
      // signUp: (context) => SignUp(),
      // newOrdersDrawer: (context) => NewOrdersDrawer(),
      // editItem: (context) => EditItemPage(),
      // reviewsPage: (context) => Reviews(),
      sendToBank: (context) => SendToBank(),
      addAddress: (context) => AddAddress(),

      // myEarnings: (context) => MyEarningsPage(),

      // contactUs: (context) => ContactUsPage(),
      // chooseLanguage: (context) => ChooseLanguage(),
    };
  }
}
