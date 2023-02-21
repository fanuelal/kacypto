import '../screens/userInfoaddScreen.dart';
import 'package:flutter/material.dart';
import '../Styles/theme.dart';
import '../widgets/drawer.dart';
import '../widgets/profileItem.dart';

class ProfileScreen extends StatelessWidget {
  static final routeName = "transferScreen";
  final CustomAppBar customAppBar = new CustomAppBar();
  final notification = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.firstDarkColor,
      appBar: customAppBar.mainAppBar("Account Info", notification),
      drawer: Drawerpage(),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: size.height * 0.13,
              child: Container(
                width: size.width * 0.8,
                padding: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: AppColor.Darkgrey,
                    borderRadius: BorderRadius.circular(15)),
                height: size.height * 0.6,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    ProfileItem(
                      itemText: "UserName",
                      icon: Icons.account_box,
                    ),
                    ProfileItem(
                      itemText: "Email Address",
                      icon: Icons.email,
                    ),
                    ProfileItem(
                      itemText: "Bank account",
                      icon: Icons.account_balance,
                    ),
                    ProfileItem(
                      itemText: "TeleBirr",
                      icon: Icons.monetization_on,
                    ),
                    ProfileItem(
                      itemText: "Transactions",
                      icon: Icons.history,
                      trailIcon: Icons.keyboard_arrow_right,
                    ),
                    ProfileItem(
                      itemText: "National ID",
                      icon: Icons.perm_identity,
                      trailIcon: Icons.camera_alt,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.3,
              top: size.height * .05,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: size.width * 0.15,
                    backgroundImage: NetworkImage(
                        "https://i.tribune.com.pk/media/images/Yuga-Labs-Bored-Ape-Yacht-Club-44661639472731-0/Yuga-Labs-Bored-Ape-Yacht-Club-44661639472731-0.jpg"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 80, horizontal: 70),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserInfoAdd()));
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 30,
                          color: AppColor.white,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
