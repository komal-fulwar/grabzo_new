import 'dart:convert';
import 'package:Grabzo/constant/constants.dart';
import 'package:Grabzo/model/ProfilBean.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  Future<dynamic> register(
      String name, String email, String mobileNum, String password) async {
    String url = Constants.apiUrl + "user/sign_up";
    Map<String, String> headers = {"Content-type": "application/json"};

    String json =
        """{"user": { "name": "$name", "email": "$email", "password": "$password", "phone_number": "$mobileNum"}}""";

    Response response = await post(url, headers: headers, body: json);
    return jsonDecode(response.body);
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
}
