import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Styles/theme.dart';

class ProfileItem extends StatelessWidget {
  final String itemText;
  final IconData icon;
  IconData trailIcon;
  ProfileItem(
      {required this.itemText,
      required this.icon,
      this.trailIcon = Icons.edit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.iceWhite,
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          itemText,
          style: GoogleFonts.roboto(color: AppColor.white, fontSize: 20),
        ),
        trailing: IconButton(
          icon: Icon(trailIcon),
          onPressed: () {},
        ),
      ),
    );
  }
}
