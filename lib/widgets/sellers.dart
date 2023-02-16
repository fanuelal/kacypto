import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Styles/theme.dart';

class SellerView extends StatefulWidget {
  final String url;

  const SellerView({required this.url});
  @override
  State<SellerView> createState() => _SellerViewState();
}

class _SellerViewState extends State<SellerView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.white,
                child: Icon(
                  Icons.account_circle,
                  size: 50,
                  color: AppColor.firstDarkColor,
                ),
              ),
              title: Text(
                "Seller one",
                style: GoogleFonts.robotoMono(color: AppColor.firstDarkColor),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("254", style: AppTextStyle.number),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("14", style: AppTextStyle.number),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("BTC 0.4",
                          style: GoogleFonts.poppins(
                              color: AppColor.gold, fontSize: 12)),
                    )
                  ],
                ),
              ),
              trailing: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.firstDarkColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 15,
                  ),
                  label: Text("View")),
            ),
          ),
        ],
      ),
    );
  }
}