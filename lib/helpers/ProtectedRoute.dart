import 'package:flutter/material.dart';
import '../providers/auth.dart';
import '../screens/bottomNavBar.dart';
import 'package:provider/provider.dart';

class ProtectedRoute {
  bool isProtected(context) {
    final _isAuth = Provider.of<Auth>(context, listen: false).isAuth;
    if (_isAuth) {
      Navigator.of(context).pushReplacementNamed(CustomBottomNavBar.routeName);
      return true;
    }
    return false;
  }
}
