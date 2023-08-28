import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/shapes/topProducts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/assets.dart';
import 'netWorkImageShape.dart';

class categories extends StatelessWidget {
  categories({Key? key,required this.img,required this.txt,required this.onTap}) : super(key: key);

  var onTap, img, txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                netWorkImageShape(
                    img: img,
                    ht: 110.0,
                    wdt: 130.0,
                    left_margin: 0.0,
                    right_margin: 0.0,
                    onTap:onTap),
                5.heightBox,
                Text(
                  txt,
                  style: TextStyle(fontSize: 14, color: blackColor,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
