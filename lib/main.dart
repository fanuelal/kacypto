import './providers/auth.dart';
import './screens/Authentication.dart';

import './providers/local_authProvider.dart';
import './screens/PinScreen.dart';
import './screens/bottomNavBar.dart';
import './screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'Styles/theme.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LocalAuth(),
      ),
      ChangeNotifierProvider(create: (_) => Auth())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (ctx, _auth, child) {
        print(_auth.isAuth);
        return MaterialApp(
          title: 'Kasypto',
          theme: ThemeData(
              primaryColorDark: AppColor.firstColor, textTheme: TextTheme()),
          debugShowCheckedModeBanner: false,
          home: PinScreen(),
          // _auth.isAuth ? HomeScreen() :
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            CustomBottomNavBar.routeName: (context) => CustomBottomNavBar(),
            Authentication.routeName: (context) => Authentication()
            // PinScreen.routeName: (context) => PinScreen()
          },
        );
      },
    );
  }
}
