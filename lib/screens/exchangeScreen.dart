import 'package:flutter/material.dart';
import '../Styles/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';

class ExchangeScreen extends StatelessWidget {
  static final routeName = "transferScreen";
  final CustomAppBar customAppBar = new CustomAppBar();
  final notification = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.firstDarkColor,
      appBar: customAppBar.mainAppBar("Exchange", notification),
      drawer: Drawerpage(),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: size.width * 0.2),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: AppColor.firstLightColor,
                            side: BorderSide(color: AppColor.firstLightColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Buy",
                            style: AppTextStyle.buttonText,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.firstLightColor,
                            foregroundColor: AppColor.firstDarkColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Sell", style: AppTextStyle.buttonText),
                        )),
                  ),
                ],
              ),
            ),
            Center(
              child: Text("xashjfghsdfbdfhsgddf"),
            )
          ],
        ),
      ),
    );
  }
}
