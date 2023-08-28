
import 'package:flutter/material.dart';

class topProducts extends StatelessWidget {
  topProducts(
      {Key? key,
      required this.img,
      required this.is_asset,
      required this.ht,
      required this.wdt,
      required this.onTap})
      : super(key: key);

  var img, ht, wdt, onTap, is_asset;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: ht,
          width: wdt,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: is_asset ? AssetImage(img) : img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
