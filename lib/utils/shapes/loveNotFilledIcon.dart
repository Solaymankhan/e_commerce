import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';

class loveNotFilledIcon extends StatelessWidget {
  const loveNotFilledIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(CupertinoIcons.heart, color: lightGreyColor, size: 20)
        .box
        .margin(EdgeInsets.only(top: 8, right: 8))
        .make();
  }
}
