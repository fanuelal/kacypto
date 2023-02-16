import './exchangeScreen.dart';
import './profileScreen.dart';
import './transferScreen.dart';
import 'package:flutter/material.dart';
import '../Styles/theme.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart' as badges;

class CustomBottomNavBar extends StatefulWidget {
  static final routeName = "NavbarRoute";

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [HomeScreen(), TransferScreen(), ExchangeScreen(), ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.wallet,
          size: 20,
        ),
        title: ("Wallet"),
        activeColorPrimary: AppColor.iceWhite,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.arrowRightArrowLeft,
          size: 20,
        ),
        title: ("Exchange"),
        activeColorPrimary: AppColor.iceWhite,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.currency_exchange,
          size: 20,
        ),
        title: ("Swap"),
        activeColorPrimary: AppColor.iceWhite,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person_3_rounded,
          size: 25,
        ),
        title: ("Account"),
        activeColorPrimary: AppColor.iceWhite,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  CustomAppBar _customAppBar = CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _customAppBar.mainAppBar("title", 2),
      backgroundColor: AppColor.firstDarkColor,
      bottomNavigationBar: PersistentTabView(
        context,
        padding: NavBarPadding.all(10),
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: false,
        backgroundColor: AppColor.firstDarkColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 10),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: false,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style13,
      ),
    );
  }
}
