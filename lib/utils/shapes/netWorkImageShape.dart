import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/utils/shapes/topProducts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/assets.dart';

class netWorkImageShape extends StatelessWidget {
  netWorkImageShape(
      {Key? key,
      required this.img,
      required this.ht,
      required this.wdt,
      required this.left_margin,
      required this.right_margin,
      required this.onTap})
      : super(key: key);
  var img, ht, wdt, left_margin, right_margin, onTap;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img,
      imageBuilder: (context, url) => topProducts(
          img: url, is_asset: false, ht: ht, wdt: wdt, onTap: onTap),
      placeholder: (context, url) => topProducts(
          img: error_image, is_asset: true, ht: ht, wdt: wdt, onTap: onTap),
      errorWidget: (context, url, error) => topProducts(
          img: error_image, is_asset: true, ht: ht, wdt: wdt, onTap: onTap),
    )
        .box
        .margin(EdgeInsets.only(left: left_margin, right: right_margin))
        .make();
  }
}
