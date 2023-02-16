import 'package:flutter/material.dart';
import '../Styles/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceCard extends StatelessWidget {
  final String url;

  const BalanceCard({required this.url});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.37,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: AppColor.siliver),
      child: Card(
          elevation: 2,
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 219, 218, 218),

              // ])
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.iceWhite,
                      radius: 20,
                      backgroundImage: NetworkImage(url),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("BTC",
                        style: GoogleFonts.sora(
                            color: AppColor.firstDarkColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(
                  "0.0 Et",
                  style: GoogleFonts.robotoMono(
                      color: AppColor.firstLightDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "0.0 USD",
                  style: GoogleFonts.robotoMono(
                      color: AppColor.firstLightDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        color: AppColor.green,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("1 btc  ~ 223,811.14",
                          style: GoogleFonts.robotoMono(
                            color: AppColor.green,
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
