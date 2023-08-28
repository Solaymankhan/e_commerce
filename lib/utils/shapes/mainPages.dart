import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../viewAndViewModel/main/bloc/main_function_bloc.dart';
import '../../viewAndViewModel/pages/categories/categoriesPage.dart';
import '../../viewAndViewModel/pages/home/homePage.dart';
import '../../viewAndViewModel/pages/profile/profilePage.dart';
import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';


class mainPages extends StatelessWidget {
  mainPages({Key? key,required this.mainFunctionBloc,required this.index}) : super(key: key);
  MainFunctionBloc  mainFunctionBloc;
  int index;
  var nav_body = [
    homePage(),
    categoriesPage(),
    profilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(child: IndexedStack(index: index, children: nav_body))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: greenColor,
          selectedFontSize: 13,
          unselectedFontSize: 12,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(index == 0 ? home_selected_svg : home_svg),
                label: home_txt),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    index == 1 ? category_selected_svg : category_svg),
                label: categories_txt),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    index == 2 ? profile_selected_svg : profile_svg),
                label: profile_txt)
          ],
          onTap: (value) {
            mainFunctionBloc.add(MainFuncBottomNavigationClickEvent(value));
          },
        ));
  }
}
