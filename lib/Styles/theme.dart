import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar {
  // CustomAppBar(this.title);
  PreferredSizeWidget mainAppBar(String title, int notification) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.0),
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.notes),
            );
          }),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 25, top: 10),
              child: badges.Badge(
                showBadge: notification < 0,
                badgeContent: Text(
                  notification.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.notifications),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: AppColor.purple,
                  padding: EdgeInsets.all(5),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )
          ],
          title: Text(
            title,
            style: AppTextStyle.title,
          ),
          titleTextStyle: AppTextStyle.title,
          elevation: 0,
        ),
      ),
    );
  }
}

class AppColor {
  static final firstLightColor = Colors.white;
  static final smokeWhite = Color.fromARGB(255, 219, 218, 218);
  static final siliver = Color.fromARGB(0, 177, 176, 176);
  static const firstDarkColor = Color.fromARGB(255, 9, 6, 29);
  static const firstLightDark = Color.fromARGB(255, 88, 87, 88);
  static const firstColor = Color.fromARGB(255, 15, 11, 53);
  static const firstlightColor = Color.fromARGB(21, 255, 217, 0);
  static const gold = Colors.amber;
  static const white = Color.fromARGB(255, 177, 176, 184);
  static const iceWhite = Color.fromARGB(255, 255, 255, 255);
  static final green = Colors.green;
  static final Darkgrey = Color.fromARGB(255, 47, 47, 48);
  static final contentColorCyan = Colors.cyan;
  static final contentColorBlue = Color.fromARGB(255, 31, 112, 253);
  static final purple = Color.fromARGB(255, 138, 7, 120);
  static final lightPurple = Color.fromARGB(255, 245, 12, 214);
}

class AppTextStyle {
  final BuildContext context;
  AppTextStyle(this.context);
  static final title =
      GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.bold);
  static final subtitle = GoogleFonts.raleway(
      fontSize: 17, color: Color.fromARGB(255, 167, 166, 166));
  static final number = GoogleFonts.dosis();
  static final boldtext = GoogleFonts.sora(color: Colors.white, fontSize: 25);
  static final buttonText =
      GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold);
}
