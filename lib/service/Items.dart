import 'dart:convert';
import 'package:Grabzo/constant/constants.dart';
import 'package:Grabzo/model/ItemBean.dart';
import 'package:Grabzo/model/ItemsBean.dart';
import 'package:Grabzo/model/SearchItemBean.dart';
import 'package:Grabzo/model/ShopBean.dart';
import 'package:Grabzo/model/ShopsBean.dart';
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

  Future<ItemBean> getItem(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "item/$id";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return ItemBean.fromJson(map);
    } else {
      return null;
    }
  }

  Future<ItemsBean> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "cart/get_cart";
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

  Future<SearchItemBean> searchItem(String itemName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "search/search?search_term=$itemName";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return SearchItemBean.fromJson(map);
    } else {
      return null;
    }
  }

  Future<ShopsBean> getAllShops() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "shops";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return ShopsBean.fromJson(map);
    } else {
      return null;
    }
  }

  Future<ShopBean> getAllShopsItems(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "shop/$id/items";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return ShopBean.fromJson(map);
    } else {
      return null;
    }
  }

  Future<bool> addToCart(int itemId, int itemPrice, int qty) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "cart/add_to_cart";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };

    String json = """{
          "item_id": $itemId,
          "quantity": $qty,
          "price": $itemPrice
        }}""";
    print("id : $itemId | price : $itemPrice");
    Response response = await post(url, headers: headers, body: json);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
