import 'package:casypto/widgets/dropDownItem.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Styles/theme.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import '../providers/cryptoProvider.dart';

class RequestView extends StatelessWidget {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<Auth>(context);
    final coins = Provider.of<Crypto>(context).coins;
    var Cryptoaddress = 'bc1zzwa3jp${auth.userId}';
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
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
            SizedBox(height: 15),
            Stack(children: [
              SizedBox(
                height: 60,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    label: Text(
                      "bc1zzwa3jp${auth.userId}",
                      style: TextStyle(color: AppColor.white, fontSize: 13),
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
              Positioned(
                right: 1,
                top: 1,
                bottom: 1,
                child: Container(
                  color: Colors.grey,
                  height: 57,
                  child: IconButton(
                    icon: Icon(
                      Icons.copy,
                      color: AppColor.iceWhite,
                    ),
                    onPressed: () async {
                      
                      await Clipboard.setData(ClipboardData(
                          text: Cryptoaddress));
                      SnackBar copied = SnackBar(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          content: Text("Address Copied"));
                      ScaffoldMessenger.of(context).showSnackBar(copied);
                    },
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: size.width,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text("share"),
                icon: Icon(Icons.share),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.Darkgrey,
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              width: size.width * .6,
              height: size.width * .6,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: InteractiveViewer(
                panEnabled: false, // Set it to false
                boundaryMargin: EdgeInsets.all(100),
                minScale: 0.5,
                maxScale: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    color: AppColor.iceWhite,
                    child: QrImage(
                      data: Cryptoaddress,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
