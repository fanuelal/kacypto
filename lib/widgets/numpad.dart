import 'package:casypto/screens/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Styles/theme.dart';
import '../providers/local_authProvider.dart';
import 'package:quickalert/quickalert.dart';

class NumPad extends StatelessWidget {
  final int number;
  const NumPad({required this.number});

  Future<dynamic> _buildPopupDialog(BuildContext context) {
    final localAuth = Provider.of<LocalAuth>(context, listen: false);

    return QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Authentication Failed',
        titleColor: AppColor.iceWhite,
        text: "Please Enter your correct pin",
        textColor: AppColor.iceWhite,
        confirmBtnColor: AppColor.purple,
        confirmBtnText: 'OK',
        onConfirmBtnTap: () {
          localAuth.clearPin();
          Navigator.of(context).pop();
        },
        backgroundColor: AppColor.Darkgrey);
  }

  @override
  Widget build(BuildContext context) {
    final localAuth = Provider.of<LocalAuth>(context, listen: false);
    return RawMaterialButton(
      constraints: BoxConstraints(minHeight: 60, minWidth: 60),
      shape: CircleBorder(
        side: BorderSide(
            width: 1, style: BorderStyle.solid, color: AppColor.iceWhite),
      ),
      child: Text(
        number.toString(),
        style: GoogleFonts.sora(color: AppColor.iceWhite, fontSize: 20),
      ),
      onPressed: () {
        localAuth.pinInserted(number);
        if (localAuth.isFull()) {
          if (localAuth.isCorrectPin()) {
            Navigator.of(context).pushReplacementNamed(Authentication.routeName);
            Navigator.of(context).pop();
          } else {
            _buildPopupDialog(context);
          }
        }
      },
    );
  }
}
