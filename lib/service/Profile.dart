import 'dart:convert';
import 'package:grabzo/constant/constants.dart';
import 'package:grabzo/model/OrdersBean.dart';
import 'package:grabzo/model/ProfilBean.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  Future<bool> register(
      String name, String email, String mobileNum, String password) async {
    String url = Constants.apiUrl + "user/sign_up";
    Map<String, String> headers = {"Content-type": "application/json"};

    String json =
        """ { "name": "$name", "email": "$email", "password": "$password", "phone_number": "$mobileNum"}""";

    Response response = await post(url, headers: headers, body: json);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    String url = Constants.apiUrl + "user/auth";
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = """{
              "auth":
                  {
                    "email": "$email",
                    "password": "$password"
                  }
          }""";

    Response response = await post(url, headers: headers, body: json);
    if (response.statusCode == 201) {
      Map<String, dynamic> map = jsonDecode(response.body);

      print("Token: ${map["jwt"]}");
      return map["jwt"];
    } else {
      return null;
    }
  }

  Future<ProfileBean> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "user/profile";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    print(token);
    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return ProfileBean.fromJson(map);
    } else {
      return null;
    }
  }

  Future<bool> updateProfile(
      String name, String email, String number, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "user/profile/update";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };

    String json = """{ "email": "$email",
                                    "name": "$name",
                                    "phone_number": $number,
                                    "password": "$password"
                                  
                              }""";

    Response response = await patch(url, headers: headers, body: json);
    if (response.statusCode == 200) // check response number
    {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateAddress(
      String street1,
      String street2,
      String landmark,
      String city,
      String state,
      String country,
      String pincode,
      String method) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };

    String json = """{ "street1": "$street1",
                     "street2": "$street2",
                     "landmark": "$landmark",
                     "city": "$city",
                     "state": "$state",
                     "country": "$country",
                     "pin": $pincode
		                } """;

    if ("put" == method) {
      String url = Constants.apiUrl + "user/profile/address/create";
      Response response = await post(url, headers: headers, body: json);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      String url = Constants.apiUrl + "user/profile/address/update";
      Response response = await patch(url, headers: headers, body: json);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("wholesale");
    var token = prefs.getString('token');
    print("AFTER LOGOUT Token : $token");
  }

  Future<OrdersBean> getOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String url = Constants.apiUrl + "/order/get_orders";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    print(token);
    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return OrdersBean.fromJson(map);
    } else {
      return null;
    }
  }
}
