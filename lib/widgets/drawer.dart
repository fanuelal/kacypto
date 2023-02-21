import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Styles/theme.dart';

class Drawerpage extends StatelessWidget {
  const Drawerpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .6,
      color: Color.fromARGB(255, 219, 218, 218),
      child: Drawer(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColor.firstDarkColor,
                    ),
                    currentAccountPicture: CircleAvatar(
                      radius: size.width * .1,
                      backgroundImage: NetworkImage(
                          "https://i.tribune.com.pk/media/images/Yuga-Labs-Bored-Ape-Yacht-Club-44661639472731-0/Yuga-Labs-Bored-Ape-Yacht-Club-44661639472731-0.jpg"),
                    ),
                    accountName: Text(
                      "Username",
                      style: GoogleFonts.roboto(
                          color: AppColor.gold,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text("Useremail@gmail.com")),
              ),
            ),
            DrawerMenu("My wallet", Icons.wallet),
            DrawerMenu("History", Icons.history),
            DrawerMenu("Active sell", Icons.monetization_on),
            DrawerMenu("Diposit", Icons.download),
            Divider(),
            SizedBox(
              height: 20,
            ),
            DrawerMenu("Setting", Icons.settings),
            DrawerMenu("share", Icons.share),
            DrawerMenu("Logout", Icons.logout)
          ],
        ),
      ),
    );
  }
}

Widget DrawerMenu(String title, IconData icon) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    trailing: Icon(Icons.keyboard_arrow_right),
  );
}
