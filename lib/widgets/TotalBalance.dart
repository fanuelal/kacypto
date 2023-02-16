import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Styles/theme.dart';

class DepositedBalance extends StatelessWidget {
  List<Color> gradiantColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a)
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: (size.height - 50) * 0.35,
      child: Column(
        children: [
          Container(
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  "My Wallet",
                  style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
                SizedBox(width: 50),
                Text(
                  "32.467 USD",
                  style: AppTextStyle.boldtext,
                ),
              ],
            ),
          ),
          Container(
              width: size.width,
              margin: EdgeInsets.only(left: size.width * 0.4),
              child: Row(
                children: [
                  Text("\$ 27.893 ", style: AppTextStyle.subtitle),
                  // SizedBox(width: 5),
                  Text("\ +4.643 %",
                      style: GoogleFonts.dosis(color: AppColor.green)),
                ],
              )),
          Container(
            height: size.height * .17,
            width: size.width,
            child: LineChart(
              LineChartData(
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 6,
                  // gridData: FlGridData(
                  //     show: true,
                  //     getDrawingHorizontalLine: (value) {
                  //       return FlLine(
                  //         color: const Color(0xff374344),
                  //         strokeWidth: 2,
                  //       );
                  //     }),
                  // borderData: FlBorderData(
                  //     show: true,
                  //     border: Border.all(color: Color(0xff374344), width: 1)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(2.6, 2),
                        FlSpot(4.9, 5),
                        FlSpot(6.9, 2.5),
                        FlSpot(7.9, 5),
                        FlSpot(11, 2.3),
                      ],
                      isCurved: true,
                      gradient: LinearGradient(colors: gradiantColors),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: gradiantColors
                              .map((color) => color.withOpacity(0.3))
                              .toList(),
                        ),
                      ),
                      // color: LinearGradient(colors: gradiantColors),
                    )
                  ]),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: size.width * 0.2),
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
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 15),
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
        ],
      ),
    );
  }
}
