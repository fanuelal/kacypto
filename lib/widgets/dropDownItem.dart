import 'package:flutter/material.dart';

import '../Styles/theme.dart';

class DropDownCustomItem extends StatelessWidget {
  final String image;
  final String name;

  const DropDownCustomItem({super.key, required this.image, required this.name});
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
                image),
          ),
          SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(color: AppColor.iceWhite),
          ),
        ],
      ),
    );
    ;
  }
}
