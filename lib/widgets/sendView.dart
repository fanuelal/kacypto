import 'package:casypto/Models/crypto.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Styles/theme.dart';
import './dropDownItem.dart';
import 'package:provider/provider.dart';
import '../providers/cryptoProvider.dart';

class SendView extends StatefulWidget {
  const SendView({super.key});

  @override
  State<SendView> createState() => _SendViewState();
}

class _SendViewState extends State<SendView> {
  QRViewController? qrController;
  String getResult = "";
  bool _isScanning = false;
  final qrkey = GlobalKey(debugLabel: 'QR');
  Widget scanQRCode(BuildContext context) => QRView(
        key: qrkey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderRadius: 10,
          borderLength: 20,
        ),
      );
  String qrCode = "";
  void onQRViewCreated(QRViewController controller) {
    setState(() => this.qrController = qrController);
    controller.scannedDataStream.listen((qrCode) {
      setState(() {
        this.qrCode = qrCode.toString();
        _isScanning = false;
        _recAddress.text = qrCode.code.toString();
      });
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  TextEditingController _recAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var coins = Provider.of<Crypto>(context).coins;
    // coins = coins.getRange(0, 5).toList();
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                SizedBox(
                  height: 60,
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    dropdownColor: AppColor.Darkgrey,
                    iconEnabledColor: AppColor.iceWhite,
                    onChanged: (_) {},
                    items: [
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.center,
                        child: DropDownCustomItem(
                            image: coins[0].image, name: coins[0].name),
                      ),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.iceWhite),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.iceWhite),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.purple),
                      ),
                    ),
                  ),
                ),
                _isScanning
                    ? Container(
                        height: size.height * 0.28,
                        width: size.width * 0.8,
                        child: scanQRCode(context))
                    : Text(''),
              ]),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: TextField(
                  controller: _recAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: Text(
                      "Receiver address",
                      style: TextStyle(color: AppColor.white),
                    ),
                    suffixIcon: Icon(
                      Icons.trending_down,
                      color: AppColor.iceWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.iceWhite),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.purple),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: Text(
                      "Receiver UserName",
                      style: TextStyle(color: AppColor.white),
                    ),
                    suffixIcon: Icon(
                      Icons.account_box,
                      color: AppColor.iceWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.iceWhite),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.purple),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: Text(
                      "Amount money",
                      style: TextStyle(color: AppColor.white),
                    ),
                    suffixIcon: Icon(
                      Icons.monetization_on,
                      color: AppColor.iceWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.iceWhite),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.purple),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.purple,
                      maximumSize: Size(size.width, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.send),
                    label: Text("Send")),
              ),
              SizedBox(
                height: size.width * 0.3,
              ),
              Container(
                alignment: Alignment.bottomRight,
                width: size.width,
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: RawMaterialButton(
                    fillColor: AppColor.iceWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Scan",
                          style: GoogleFonts.robotoMono(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColor.purple),
                        ),
                        Icon(
                          Icons.qr_code_scanner_rounded,
                          color: AppColor.purple,
                          size: 35,
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        _isScanning = true;
                      });
                      print("pressed");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
