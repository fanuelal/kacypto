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
import './providers/user.dart';
import 'package:flutter/services.dart';
import './providers/cryptoProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (_) => LocalAuth(),
      ),
      ChangeNotifierProvider<Auth>(
          create: (_) => Auth(),),
      ChangeNotifierProvider<Crypto>(create: (_) => Crypto() ),
      ChangeNotifierProxyProvider<Auth, UserProvider>(
        update: (context, auth, userPr) => UserProvider(authToken: auth.token, userId: auth.userId as String ),
        create: (_) => UserProvider(),
        ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
          SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Consumer<Auth>(
      builder: (ctx, _auth, child) {
        print(_auth.isAuth);
        return MaterialApp(
          title: 'Kasypto',
          theme: ThemeData(
              primaryColorDark: AppColor.firstColor, textTheme: TextTheme()),
          debugShowCheckedModeBanner: false,
          home: PinScreen(),
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            CustomBottomNavBar.routeName: (context) => CustomBottomNavBar(),
            Authentication.routeName: (context) => Authentication()
          },
        );
      },
    );
  }
}
