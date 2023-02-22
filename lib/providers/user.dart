import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String name;
  final String email;
  final String profileImg;
  final double balance;
  final String telebirAccount;
  final String accountType;

  User(
      {required this.telebirAccount,
      required this.name,
      required this.email,
      required this.profileImg,
      required this.balance,
      required this.accountType});
}

class UserProvider with ChangeNotifier {
  late String authToken;
  late String userId;
  User user = User(
    name: "name",
    email: "email address",
    profileImg:
        "https://i.tribune.com.pk/media/images/Yuga-Labs-Bored-Ape-Yacht-Club-44661639472731-0/Yuga-Labs-Bored-Ape-Yacht-Club-44661639472731-0.jpg",
    balance: 32,
    accountType: "not verified",
    telebirAccount: "Telebirr account",
  );

  UserProvider({this.authToken = "", this.userId = ""});
  Future<bool> addUser(
    String name,
    String image,
    String teleBirr,
  ) async {
    final url = Uri.parse(
        'https://kacypto-default-rtdb.firebaseio.com//Users/$userId.json?auth=$authToken');
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "name": name,
            "ProfileImage": image,
            "telebirrAccount": teleBirr,
            "accountType": true
          }));
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      notifyListeners();
      return false;
    }

  }
}
