import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/shapes/loveFillIcon.dart';
import 'package:e_commerce/utils/shapes/loveNotFilledIcon.dart';
import 'package:e_commerce/utils/shapes/topProducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/assets.dart';
import 'netWorkImageShape.dart';

class categoriesItems extends StatelessWidget {
  categoriesItems(
      {Key? key,
      required this.img,
      required this.description,
      required this.weight,
      required this.price,
      required this.discount,
      required this.onItemTap,
      required this.onLoveTap,
      required this.onPlusTap})
      : super(key: key);
  var img,
      description,
      weight,
      price,
      discount,
      onItemTap,
      onLoveTap,
      onPlusTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                netWorkImageShape(
                    img: img,
                    ht: 90.0,
                    wdt: 120.0,
                    left_margin: 0.0,
                    right_margin: 0.0,
                    onTap: onItemTap),
                if (discount.round() != 0)
                  Text(
                    "${discount.round()}%",
                    style: TextStyle(
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                      .box
                      .color(greenColor.withOpacity(0.2))
                      .padding(EdgeInsets.only(left: 3, right: 3))
                      .customRounded(BorderRadius.circular(2))
                      .make()
              ],
            ),
            8.heightBox,
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: writingGreyColor,
                  height: 1.2),
            ),
            3.heightBox,
            Text(
              "${weight}kg",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: lightGreyColor),
            ),
            2.heightBox,
            Text.rich(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              TextSpan(
                children: [
                  TextSpan(
                    text: "¥${discountPrice(price, discount)}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: greenColor),
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    width: 5,
                  )),
                  if (discount.round() != 0)
                    TextSpan(
                      text: "¥${price}",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: lightGreyColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
            ).expand(),
          ],
        ).box.padding(EdgeInsets.all(5)).make(),
        Material(
          color: transColor,
          child: InkWell(onTap: onItemTap),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (discount.round() == 0)
              loveNotFilledIcon().onTap(onLoveTap)
            else
              loveFillIcon().onTap(onLoveTap),
            Stack(
              children: [
                Icon(
                  CupertinoIcons.plus,
                  color: whiteColor,
                  size: 18,
                ).box.color(greenColor).padding(EdgeInsets.all(5)).make(),
                Material(
                  color: transColor,
                  child: InkWell(onTap: onPlusTap),
                ),
              ],
            ).box.height(28).width(28).make(),
          ],
        ).objectCenterRight()
      ],
    ).box.height(190).color(bgGreyColor).width(130).make();
  }
}

discountPrice(price, discount) {
  double discountAmount = price * (discount / 100);
  double discountedPrice = price - discountAmount;
  return discountedPrice.round();
}
