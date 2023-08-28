import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/shapes/mainPages.dart';
import 'bloc/main_function_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MainFunctionBloc mainFunctionBloc = new MainFunctionBloc();
  @override
  Widget build(BuildContext context) {
    mainFunctionBloc.add(MainFuncBottomNavigationClickEvent(0));
    return MaterialApp(
        title: app_name_txt,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: greenColor),
          useMaterial3: true,
        ),
        home: BlocConsumer<MainFunctionBloc, MainFunctionState>(
          bloc: mainFunctionBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MainFuncBottomNavigationClickState)
              return mainPages(mainFunctionBloc: mainFunctionBloc, index:state.index);
            else
              return Scaffold(body: Container());
          },
        ));
  }
}
