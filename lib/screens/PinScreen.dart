import 'package:casypto/screens/Authentication.dart';
import 'package:flutter/material.dart';
import '../Styles/theme.dart';
import '../widgets/numpad.dart';
import '../providers/local_authProvider.dart';
import 'package:provider/provider.dart';
import '../helpers/local_auth.dart';
import 'package:lottie/lottie.dart';

class PinScreen extends StatefulWidget {
  static final routeName = "pinScreen";

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  bool authenticate = false;
  @override
  void initState() {
    super.initState();
    LocalAuthHelper.authenticate().then((value) {
      if (value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Authentication()));
      }
    });
  }
  
  void authenticationChecher(isAuth) {
    if (isAuth) {
      Navigator.of(context).pushReplacementNamed(Authentication.routeName);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final pinInput = Provider.of<LocalAuth>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.firstDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width * 0.7,
              child: LottieBuilder.asset(
                "assets/lottie/lock.json",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: pinInput.pinInput.length >= 1
                          ? Colors.white
                          : Colors.transparent,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: pinInput.pinInput.length >= 2
                          ? Colors.white
                          : Colors.transparent,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: pinInput.pinInput.length >= 3
                          ? Colors.white
                          : Colors.transparent,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: pinInput.pinInput.length >= 4
                          ? Colors.white
                          : Colors.transparent,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumPad(number: 1),
                NumPad(number: 2),
                NumPad(number: 3),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumPad(number: 4),
                NumPad(number: 5),
                NumPad(number: 6),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumPad(number: 7),
                NumPad(number: 8),
                NumPad(number: 9),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RawMaterialButton(
                  constraints: BoxConstraints(minHeight: 60, minWidth: 60),
                  shape: CircleBorder(
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: AppColor.iceWhite),
                  ),
                  child: Icon(
                    Icons.fingerprint,
                    color: AppColor.iceWhite,
                    size: 50,
                  ),
                  onPressed: () {
                    LocalAuthHelper.authenticate().then((value) {
                      if (value)
                        Navigator.of(context)
                            .pushReplacementNamed(Authentication.routeName);
                    });
                  },
                ),
                NumPad(number: 0),
                RawMaterialButton(
                  constraints: BoxConstraints(minHeight: 60, minWidth: 60),
                  shape: CircleBorder(
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: AppColor.iceWhite),
                  ),
                  child: Icon(
                    Icons.backspace_rounded,
                    color: AppColor.iceWhite,
                    size: 30,
                  ),
                  onPressed: () {
                    pinInput.canclePressed();
                    setState(() {});
                    print(pinInput.pinInput.length);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
