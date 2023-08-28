import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';

class loveFillIcon extends StatelessWidget {
  const loveFillIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(CupertinoIcons.heart_fill, color: redColor, size: 20)
        .box
        .margin(EdgeInsets.only(top: 8, right: 8))
        .make();
  }
}
