import 'dart:convert';
import 'package:e_commerce/networkAndData/products.dart';
import 'package:e_commerce/utils/constants/assets.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/shapes/categories.dart';
import 'package:e_commerce/utils/shapes/categoriesItems.dart';
import 'package:e_commerce/utils/shapes/heading.dart';
import 'package:e_commerce/utils/shapes/netWorkImageShape.dart';
import 'package:e_commerce/utils/shapes/roundedSmallSvgIconButton.dart';
import 'package:e_commerce/utils/shapes/topBadge.dart';
import 'package:e_commerce/viewAndViewModel/pages/itemDetails/ItemDetailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../model/productModel.dart';
import '../../../utils/constants/strings.dart';
import 'bloc/home_page_bloc.dart';

class homePage extends StatelessWidget {
  homePage({Key? key}) : super(key: key);

  //Json product items data fetching through Model . product data is in networkAndData file
  productModel myProduct = productModel.fromJson(json.decode(products));
  HomePageBloc homePageBloc = new HomePageBloc();

  @override
  Widget build(BuildContext context) {
    /*double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;*/
    homePageBloc.add(HomeSearchTapEvent(false));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,

        //AppBar menu button and search bar

        title: Row(
          children: [
            roundedSmallSvgIconButton(
                icon: hamburger_menu_svg,
                icon_clr: blackColor,
                btn_clr: transColor,
                onTap: () {}),
            SizedBox(
              width: 15,
            ),
            Flexible(
                child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: BlocConsumer<HomePageBloc, HomePageState>(
                bloc: homePageBloc,
                listener: (context, state) {},
                builder: (context, state) {
                  if(state is HomeSearchTapState)
                  return CupertinoSearchTextField(
                    suffixIcon:
                    Icon(
                      CupertinoIcons.mic,
                      color: state.is_search_taped ? greenColor : lightGreyColor,
                    ),
                    suffixMode: OverlayVisibilityMode.always,
                    decoration: BoxDecoration(
                      color: bgGreyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      homePageBloc.add(HomeSearchTapEvent(true));
                    },
                    onChanged: (val) {},
                    onSuffixTap: () {},
                  );
                  return Container();
                },
              ),
            ))
          ],
        ),
        actions: [
          topBadge(), //Top right side Badge integrated from utils Shape
          SizedBox(
            width: 25,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.heightBox,
              ScrollLoopAutoScroll(
                  //Using for auto scrolling image list
                  scrollDirection: Axis.horizontal,
                  delay: Duration(seconds: 3),
                  duplicateChild: 5,
                  duration: Duration(seconds: 50),
                  gap: 0,
                  child: Row(
                    children: myProduct.images!
                        .map((e) => netWorkImageShape(
                            //Network image shape integrated from utils Shape
                            img: e,
                            ht: 150.0,
                            wdt: 95.0,
                            left_margin: 2.5,
                            right_margin: 2.5,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => ItemDetailsPage(
                                          txt: product_details_txt)));
                            }))
                        .toList(),
                  )).box.height(150).width(double.infinity).make(),
              // Box decoration from dependency ValocityX
              20.heightBox,
              heading(
                  //Headings of Items integrated from utils Shape
                  txt: categories_txt,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                ItemDetailsPage(txt: categories_txt)));
                  }),
              10.heightBox,
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myProduct.storyCount,
                  itemBuilder: (context, index) {
                    return categories(
                            //Category shape integrated from utils Shape
                            img: myProduct.images![index],
                            txt: myProduct.groceryItems[index],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => ItemDetailsPage(
                                          txt: myProduct.groceryItems[index])));
                            })
                        .box
                        .margin(EdgeInsets.only(
                            left: index == 0 ? 20 : 5,
                            right: myProduct.storyCount - 1 == index ? 20 : 5))
                        .make();
                  }).box.height(140).width(double.infinity).make(),
              10.heightBox,
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myProduct.storyCount,
                  itemBuilder: (context, index) {
                    return categoriesItems(
                      //Category item shape integrated from utils Shape
                      img: myProduct.images[index],
                      description: myProduct.descriptions[index],
                      weight: myProduct.weights[index],
                      price: myProduct.prices[index].round(),
                      discount: myProduct.discounts[index],
                      onItemTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    ItemDetailsPage(txt: product_details_txt)));
                      },
                      onLoveTap: () {},
                      onPlusTap: () {},
                    )
                        .box
                        .margin(EdgeInsets.only(
                            left: index == 0 ? 20 : 5,
                            right: myProduct.storyCount - 1 == index ? 20 : 5))
                        .make();
                  }).box.height(190).width(double.infinity).make(),
              20.heightBox,
              heading(
                  txt: hot_items_txt,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                ItemDetailsPage(txt: hot_items_txt)));
                  }),
              10.heightBox,
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myProduct.storyCount,
                  itemBuilder: (context, index) {
                    return categoriesItems(
                      img: myProduct.images[index],
                      description: myProduct.descriptions[index],
                      weight: myProduct.weights[index],
                      price: myProduct.prices[index].round(),
                      discount: myProduct.discounts[index],
                      onItemTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    ItemDetailsPage(txt: product_details_txt)));
                      },
                      onLoveTap: () {},
                      onPlusTap: () {},
                    )
                        .box
                        .margin(EdgeInsets.only(
                            left: index == 0 ? 20 : 5,
                            right: myProduct.storyCount - 1 == index ? 20 : 5))
                        .make();
                  }).box.height(190).width(double.infinity).make(),
              35.heightBox,
              VxSwiper.builder(
                  //VxSwiper imtegrated from ValocityX dependency for image swiping
                  autoPlay: true,
                  enlargeCenterPage: true,
                  itemCount: myProduct.storyCount,
                  height: 300,
                  itemBuilder: (context, index) {
                    return netWorkImageShape(
                        img: myProduct.images[index],
                        ht: 300.0,
                        wdt: double.infinity,
                        left_margin: 5.0,
                        right_margin: 5.0,
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ItemDetailsPage(
                                      txt: product_details_txt)));
                        });
                  }),
              20.heightBox,
              heading(
                  txt: new_arrivals_txt,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                ItemDetailsPage(txt: new_arrivals_txt)));
                  }),
              10.heightBox,
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myProduct.storyCount,
                  itemBuilder: (context, index) {
                    return categoriesItems(
                      img: myProduct.images[index],
                      description: myProduct.descriptions[index],
                      weight: myProduct.weights[index],
                      price: myProduct.prices[index].round(),
                      discount: myProduct.discounts[index],
                      onItemTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    ItemDetailsPage(txt: product_details_txt)));
                      },
                      onLoveTap: () {},
                      onPlusTap: () {},
                    )
                        .box
                        .margin(EdgeInsets.only(
                            left: index == 0 ? 20 : 5,
                            right: myProduct.storyCount - 1 == index ? 20 : 5))
                        .make();
                  }).box.height(190).width(double.infinity).make(),
              10.heightBox
            ],
          ),
        ),
      ),
    );
  }
}
