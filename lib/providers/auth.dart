import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../helpers/http_exception.dart';


class Auth with ChangeNotifier {
  late String _token = "";
  DateTime _expiryDate = DateTime.now();
  late String _userId;
  late Timer _autoTimer;
  String userEmail = "user@gmail.com";
  String userName = "user";
  bool get isAuth {
    return token != "";
  }


  String? get userId {
    return _userId;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return "";
  }

  void usernameExtractor() async {
    final user = await userEmail.split("@");
    userName = user[0];
  }

  Future<void> _authenticate(
      String email, String password, String segmentStr) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$segmentStr?key=AIzaSyDsOPHTcg7ecUJMopbnuLun1_1qMKYLEr0');
    userEmail = email;
    usernameExtractor();
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      // userEmail = email;
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      // autoLoagout();
      notifyListeners();
      final userData = json.encode({
        'token': _token,
        'userId': userId,
        'expiryDate': _expiryDate.toIso8601String()
      });

      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signIn(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  // Future<bool> rememberMe() async {
  //   //   // var prefs;
  //   //   SharedPreferences.setMockInitialValues({});
  //   //   // try {
  //   //    final prefs = await SharedPreferences.getInstance();
  //   //   // } catch (error) {

  //   //   // }
  //   //   if (!prefs.containsKey('userData')) {
  //   //     return false;
  //   //   }
  //   //   final localSync =
  //   //       json.decode(prefs.getString('userData')) as Map<String, Object>;
  //   //   final expiryDate = DateTime.parse(localSync['expiryDate']);
  //   //   if (expiryDate.isBefore(DateTime.now())) {
  //   //     return false;
  //   //   }
  //   //   _token = localSync['token'];
  //   //   _userId = localSync['userId'];
  //   //   _expiryDate = localSync['expiryDate'];
  //   //   notifyListeners();
  //   //   return true;
  // }

}
