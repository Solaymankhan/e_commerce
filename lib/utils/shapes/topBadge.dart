import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';

class topBadge extends StatelessWidget {
  const topBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Badge(
      child: SvgPicture.asset(
        cup_svg,
        width: 24,
      ),
      padding: EdgeInsets.all(2),
      largeSize: 16,
      backgroundColor: greenColor,
      label: Text(
        "1K",
        style: TextStyle(
            fontSize: 10, fontWeight: FontWeight.w500, height: 0),
      ),
    );
  }
}
