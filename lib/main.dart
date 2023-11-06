import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/controllers/mainscreen_provider.dart';
import 'package:next_app/shared/bottom_nav_model.dart';
import 'package:next_app/views/navui/cartpage.dart';
import 'package:next_app/views/navui/homepage.dart';
import 'package:next_app/views/navui/profilepage.dart';
import 'package:next_app/views/navui/searchpage.dart';
import 'dart:developer' show log;
import 'package:provider/provider.dart';

const devTools = log;

void main(List<String> args) {
  runApp(
    // Wrapped MultiProvider Around MyApp.. To make it's Provided instance Accessible to all the descendant in the Widget Three..
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => MainScreenNotifier(apis: Apis())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MyApp returns Screen Util..
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        //Screen Util returns MaterialApp..
        return const MaterialApp(
          //MainScreen.....
          home: MainScreen(),
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  //List of Navigation UI......
  final List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // pageIndex has the current State in the pageList...
    int pageIndex = 0;

    devTools('$pageIndex');
    // This consumer is Listening to Only MainScreenNotifier Change in State...It then triggers a reBuild in the UI when there is a change in the PageIndex...
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) => Scaffold(
        body: SafeArea(
          // Rebuild UI Based on the State provided by MainScreenNotifier.....
          child: pageList[mainScreenNotifier.pageIndex],
        ),
        bottomNavigationBar: const BottomNavBarModel(),
      ),
    );
  }
}
