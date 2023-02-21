import 'package:flutter/material.dart';
import '../widgets/TotalBalance.dart';
import '../widgets/TrendingCrypto.dart';
import '../widgets/BalanceInCrypto.dart';
import '../Styles/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/cryptoProvider.dart';
import '../widgets/drawer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = "homeRoute";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CustomAppBar appBar = new CustomAppBar();
  bool isinit = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cryptos = Provider.of<Crypto>(context);
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
                "Crypto currency",
                style: GoogleFonts.raleway(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.white),
              ),
            ),
            FutureBuilder(
              future: cryptos.fetchandset(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(
                    child: Lottie.asset(
                      "assets/lottie/no_internet.json",
                      height: size.height * 0.3,
                      width: size.width * 0.3,
                      fit: BoxFit.cover,
                      animate: true,
                      repeat: true,
                    ),
                  );
                } else if (data.connectionState == ConnectionState.waiting) {
                  return SkeltonTred(size);
                }
                return Container(
                  height: size.height * 0.18,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => BalanceCard(
                        url: cryptos.coins[index].image,
                        symbol: cryptos.coins[index].symbol),
                  ),
                );
              },
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
            FutureBuilder(
              future: cryptos.fetchandset(),
              builder: (context, data) {
                if (data.connectionState == ConnectionState.waiting) {
                  return Container(
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                              width: size.width,
                              height: 60.0,
                              child: Shimmer.fromColors(
                                  baseColor: Color.fromARGB(255, 107, 107, 107),
                                  highlightColor:
                                      Color.fromARGB(255, 175, 174, 174),
                                  child: Card())),
                        ),
                      ),
                    ),
                  );
                } else if (data.hasError) {
                  return Center(
                    child: Lottie.asset(
                      "assets/lottie/no_internet.json",
                      height: size.height * 0.3,
                      width: size.width * 0.3,
                      fit: BoxFit.cover,
                      animate: true,
                      repeat: true,
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: cryptos.coins.length,
                      itemBuilder: (context, index) => TrandingCrypto(
                            Ethprice:
                                (cryptos.coins[index].Currentprice * 53.80)
                                    .toString(),
                            cryptoName: cryptos.coins[index].name,
                            imageUrl: cryptos.coins[index].image,
                            Usdprice:
                                cryptos.coins[index].Currentprice.toString(),
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded SkeltonTred(Size size) {
    return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: SizedBox(
                                width: size.width * 0.37, height: 100),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
  }
}
