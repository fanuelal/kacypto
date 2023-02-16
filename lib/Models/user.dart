import 'package:flutter/material.dart';

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
  User user = User(
    name: "name",
    email: "email address",
    profileImg:
        "https://i.tribune.com.pk/media/images/Yuga-Labs-Bored-Ape-Yacht-Club-44661639472731-0/Yuga-Labs-Bored-Ape-Yacht-Club-44661639472731-0.jpg",
    balance: 32,
    accountType: "Bronze",
    telebirAccount: "Telebirr account",
  );
  // Future<void> fetchUserData(){

  // }
}
