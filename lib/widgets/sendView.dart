import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Styles/theme.dart';
import './dropDownItem.dart';

class SendView extends StatelessWidget {
  const SendView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
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
                      child: DropDownCustomItem()),
                  // DropdownMenuItem(child: DropDownCustomItem()),
                  // DropdownMenuItem(child: DropDownCustomItem()),
                  // DropdownMenuItem(child: DropDownCustomItem()),
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
            SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: TextField(
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
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
