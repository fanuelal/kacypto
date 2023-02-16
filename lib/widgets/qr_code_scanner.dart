import 'package:flutter/material.dart';
import '../Styles/theme.dart';

class QrCodeScanner extends StatelessWidget {
  CustomAppBar _customAppBar = CustomAppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar.mainAppBar("Scann to Send", 0),
      
    );
  }
}
