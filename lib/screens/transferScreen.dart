import 'package:flutter/material.dart';
import '../Styles/theme.dart';
import '../widgets/drawer.dart';
import '../widgets/requestCrypto.dart';
import '../widgets/sendView.dart';

class TransferScreen extends StatefulWidget {
  static final routeName = "transferScreen";

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final CustomAppBar customAppBar = new CustomAppBar();
  final notification = 0;
  bool sendIsActive = true;
  bool requestActive = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.firstDarkColor,
      appBar: customAppBar.mainAppBar("Transfer", notification),
      drawer: Drawerpage(),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: size.width * 0.1),
                  padding: EdgeInsets.all(5),
                  child: OutlinedButton.icon(
                      icon: Icon(Icons.send),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: sendIsActive
                              ? AppColor.Darkgrey
                              : AppColor.firstLightColor,
                          backgroundColor: sendIsActive
                              ? AppColor.firstLightColor
                              : Colors.transparent,
                          side: BorderSide(color: AppColor.firstLightColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        setState(() {
                          sendIsActive = true;
                          requestActive = false;
                        });
                      },
                      label: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Send",
                          style: AppTextStyle.buttonText,
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(15),
                  child: OutlinedButton.icon(
                      icon: Icon(Icons.call_received),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: requestActive
                              ? AppColor.Darkgrey
                              : AppColor.firstLightColor,
                          backgroundColor: requestActive
                              ? AppColor.firstLightColor
                              : Colors.transparent,
                          side: BorderSide(color: AppColor.firstLightColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        setState(() {
                          sendIsActive = false;
                          requestActive = true;
                        });
                      },
                      label: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Request", style: AppTextStyle.buttonText),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            sendIsActive ? SendView() : RequestView(),
          ],
        ),
      ),
    );
  }
}
