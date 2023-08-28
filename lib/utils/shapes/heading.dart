import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/strings.dart';

class heading extends StatelessWidget {
  heading({Key? key, required this.txt, required this.onTap}) : super(key: key);

  var txt, onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Material(
            child: InkWell(
                onTap: onTap,
                child: Row(
                  children: [
                    Text(
                      see_all_txt,
                      style: TextStyle(fontSize: 14, color: lightGreyColor),
                    ),
                    Icon(CupertinoIcons.forward, color: lightGreyColor,size: 16,)
                  ],
                ))),
      ],
    ).box.margin(EdgeInsets.only(left: 20, right: 20)).make();
  }
}
