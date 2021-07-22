import 'dart:convert';
import 'package:grabzo/constant/constants.dart';
import 'package:grabzo/model/CartBean.dart';
import 'package:grabzo/model/CategoriesBean.dart';
import 'package:grabzo/model/CategoryBean.dart';
import 'package:grabzo/model/ItemBean.dart';
import 'package:grabzo/model/ItemsBean.dart';
import 'package:grabzo/model/SearchItemBean.dart';
import 'package:grabzo/model/ShopBean.dart';
import 'package:grabzo/model/ShopsBean.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  Future<CartBean> getCart() async {
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
      if (map["msg"] == null) {
        return CartBean.fromJson(map);
      } else {
        return null;
      }
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
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map data = {
      'item_id': itemId,
      'quantity': qty,
      'price': itemPrice,
    };
    // String json =
    //     """{ "item_id": $itemId, "quantity": $qty, "price": $itemPrice }""";
    // print("Add to Cart id : $itemId | price : $itemPrice");
    // Response response = await post(url, headers: headers, body: json);

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> placeOrder(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "order/place_order";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };

    String json = """{
              "cart_id": $id
            }""";

    // Response response = await post(url, headers: headers, body: json);
    // if (response.statusCode == 200) {
    return true;
    // } else {
    //   return false;
    // }
  }

  Future<CategoriesBean> getAllCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "categories";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return CategoriesBean.fromJson(map);
    } else {
      return null;
    }
  }
}
