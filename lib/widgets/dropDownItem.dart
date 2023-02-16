import 'package:flutter/material.dart';

import '../Styles/theme.dart';

class DropDownCustomItem extends StatelessWidget {
  const DropDownCustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png"),
          ),
          SizedBox(width: 10),
          Text(
            "Bitcoin",
            style: TextStyle(color: AppColor.iceWhite),
          ),
        ],
      ),
    );
    ;
  }
}
