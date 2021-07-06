import 'package:flutter/material.dart';
import 'package:grabzo/Pages/Other/add_address.dart';
import 'package:grabzo/Pages/Other/send_to_bank.dart';

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
