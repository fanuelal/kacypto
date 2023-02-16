import 'package:flutter/material.dart';
import '../widgets/TotalBalance.dart';
import '../widgets/TrendingCrypto.dart';
import '../widgets/BalanceInCrypto.dart';
import '../Styles/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  static final routeName = "homeRoute";

  // final PageController controller = PageController();
  final CustomAppBar appBar = new CustomAppBar();

  @override


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.firstDarkColor,
      appBar: appBar.mainAppBar("Wallet", 0),
      drawer: Drawerpage(),
      body: Container(
            height: size.height - 50,
            child: Column(
              children: [
                DepositedBalance(),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 10),
                  width: size.width,
                  child: Text(
                    "Cryptocoins",
                    style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white),
                  ),
                ),
                Container(
                  height: size.height * 0.18,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      BalanceCard(
                        url:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1024px-Bitcoin.svg.png",
                      ),
                      BalanceCard(
                        url:
                            "https://d33wubrfki0l68.cloudfront.net/fcd4ecd90386aeb50a235ddc4f0063cfbb8a7b66/4295e/static/bfc04ac72981166c740b189463e1f74c/40129/eth-diamond-black-white.jpg",
                      ),
                      BalanceCard(
                        url:
                            "https://img.freepik.com/premium-vector/tether-crypto-coin-cryptocurrency-isometric-illustration_641602-246.jpg?w=2000",
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                  width: size.width,
                  child: Text(
                    "Trending Cryptos",
                    style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white),
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      TrandingCrypto(
                        cryptoName: "BTC",
                        Usdprice: "22,453",
                        Ethprice: "1,223,343.43",
                        url:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1024px-Bitcoin.svg.png",
                      ),
                      TrandingCrypto(
                        cryptoName: "Eth",
                        Usdprice: "22,453",
                        Ethprice: "1,223,343.43",
                        url:
                            "https://d33wubrfki0l68.cloudfront.net/fcd4ecd90386aeb50a235ddc4f0063cfbb8a7b66/4295e/static/bfc04ac72981166c740b189463e1f74c/40129/eth-diamond-black-white.jpg",
                      ),
                      TrandingCrypto(
                          cryptoName: "USDT",
                          Usdprice: "22,453",
                          Ethprice: "1,223,343.43",
                          url:
                              "https://img.freepik.com/premium-vector/tether-crypto-coin-cryptocurrency-isometric-illustration_641602-246.jpg?w=2000"),
                      TrandingCrypto(
                        cryptoName: "Dodge",
                        Usdprice: "22,453",
                        Ethprice: "1,223,343.43",
                        url:
                            "https://cdn.freebiesupply.com/logos/large/2x/dogecoin-logo-png-transparent.png",
                      ),
                      TrandingCrypto(
                          cryptoName: "TRX",
                          Usdprice: "2.2",
                          Ethprice: "103.43",
                          url:
                              "https://img.freepik.com/premium-vector/tether-crypto-coin-cryptocurrency-isometric-illustration_641602-246.jpg?w=2000"),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
