import 'dart:convert';
import 'package:Grabzo/constant/constants.dart';
import 'package:Grabzo/model/ItemsBean.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Items {
  Future<ItemsBean> getAllItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "items";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return ItemsBean.fromJson(map);
    } else {
      return null;
    }
  }
}
