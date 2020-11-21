import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class DatabaseServiceProvider with ChangeNotifier {
  final String username;
  final String password;
  DatabaseServiceProvider({this.password, this.username});
  static const API =
      "https://stockapprealproject.herokuapp.com/users/api/login";
  static const APIRegister =
      "https://stockapprealproject.herokuapp.com/users/api/registration";
  static const APIAdmin =
      "https://stockapprealproject.herokuapp.com/adminstration/api/administration_api";
  static const APIPosition =
      "https://stockapprealproject.herokuapp.com/adminstration/api/position_assignment";
  static const APIregisterPostion =
      "https://stockapprealproject.herokuapp.com/adminstration/api/position_assignment";
  static final SESSION = FlutterSession();

  //SignIn (Api Post)
  Future<http.Response> signIn({String username, String password}) async {
    try {
      final response = await http
          .post(API, body: {"username": username, "password": password});
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //registration (POST)
  Future<http.Response> register(
      {String firstname,
      String lastname,
      String email,
      String password,
      String password2}) async {
    try {
      final response = await http.post(APIRegister, body: {
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "password": password,
        "password2": password2,
        "is_active": ''
      });
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //get all user (get)
  Future<http.Response> userAll(String token) async {
    try {
      final response = await http.get(APIAdmin, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token $token',
      });
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Assigned position
  Future<http.Response> assignedPosition(
      int userId, int positionId, int assignUserId, String token) async {
        print(userId);
        print(assignUserId);
        print(token);
        final msg = jsonEncode({"user": userId,"position": positionId,"assignment_status": "Active","supervisor": assignUserId,"assigned_by": assignUserId});
    try {
      final response = await http.post(APIregisterPostion, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token $token',
      }, body:msg);
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static setToken(String token) async {
    _AuthData data = _AuthData(token);
    await SESSION.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  static removeToken() async {
    await SESSION.prefs.clear();
  }
}

class _AuthData {
  String token;
  _AuthData(this.token);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    return data;
  }
}
/*

headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $tokens',
  }
Registration:
----------------------------
Method=>POST
url:        =>https://stockapprealproject.herokuapp.com/users/api/registration
body example =>{
  "first_name": "Kamugisha",
  "last_name": "Alex",
  "email": "kamugisha@gmail.com",
  "password": "TestingPass",
  "password2": "TestingPass",
  "is_active":1
}

https://stockapprealproject.herokuapp.com/users/sign_up/
https://stockapprealproject.herokuapp.com/

body  =>{
  "username": "kamugisha@gmail.com",
  "password": "TestingPass"
 
}
 
Response  => {
"token": "dd820d095785f8a1b849ee7cbfb27cb4f28d7645"
}
//change position




User_position_assignment_url

https://stockapprealproject.herokuapp.com/adminstration/api/position_assignment
POST
 token:
example:

{
  "user": 2,
  "position": 1,
  "assignment_status": "Active",
  "supervisor": 2,
  "assigned_by": 2
 
}


 */
