import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/shapes/roundedSmallIconButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/strings.dart';

class ItemDetailsPage extends StatelessWidget {
  ItemDetailsPage({Key? key, required this.txt}) : super(key: key);
  var txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: Row(children: [roundedSmallIconButton(
              icon: CupertinoIcons.back,
              icon_clr: blackColor,
              btn_clr: transColor,
              onTap: (){
                Navigator.pop(context);
              }),SizedBox(width: 15,),Text(txt)])),
      body: Container(),
    );
  }
}
