import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Styles/theme.dart';

class TrandingCrypto extends StatelessWidget {
  final String url;
  final String cryptoName;
  final String Usdprice;
  final String Ethprice;

  const TrandingCrypto(
      {required this.url,
      required this.cryptoName,
      required this.Usdprice,
      required this.Ethprice});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Card(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.smokeWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(url),
                  ),
                  title: Text(
                    cryptoName,
                    style: GoogleFonts.sora(color: AppColor.firstDarkColor),
                  ),
                  subtitle: Text(
                    "$cryptoName/USD",
                    style: TextStyle(
                      color: AppColor.firstLightDark,
                    ),
                  ),
                  trailing: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\$ $Usdprice",
                            style: GoogleFonts.sora(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.firstDarkColor,
                            )),
                        Text("\$ $Ethprice",
                            style: GoogleFonts.sora(
                              color: AppColor.firstDarkColor,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
