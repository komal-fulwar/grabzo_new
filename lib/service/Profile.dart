// import 'dart:convert';
// import 'package:flutter_app/constant/constants.dart';
// import 'package:http/http.dart';
//
// class Profile {
//   Future<dynamic> register(
//       String name, String email, String mobileNum, String password) async {
//     String url = Constants.apiUrl + "user/sign_up";
//     Map<String, String> headers = {"Content-type": "application/json"};
//
//     String json =
//         """{"user": { "name": "$name", "email": "$email", "password": "$password", "phone_number": "$mobileNum"}}""";
//
//     Response response = await post(url, headers: headers, body: json);
//     return jsonDecode(response.body);
//   }
//
//   Future<dynamic> signIn(String email, String password) async {
//     String url = Constants.apiUrl + "user/auth";
//     Map<String, String> headers = {"Content-type": "application/json"};
//
//     String json = """{
//     "auth":
//         {
// 	         "email": "$email",
// 		       "password": "$password"
// 	      }
// }""";
//
//     Response response = await post(url, headers: headers, body: json);
//     if (response.statusCode == 201) {
//       Map<String, dynamic> map = jsonDecode(response.body);
//       return map["jwt"];
//     } else {
//       return null;
//     }
//   }
// }
