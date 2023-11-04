import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/controllers/mainscreen_provider.dart';
import 'package:next_app/shared/bottom_nav.dart';
import 'package:ionicons/ionicons.dart';
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
        ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
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
      builder: (context, mainScreenNotifierValue, child) => Scaffold(
        body: SafeArea(
          // Rebuild UI Based on the State provided by MainScreenNotifier.....
          child: pageList[mainScreenNotifierValue.pageIndex],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.w.h),
            child: Container(
              padding: EdgeInsets.all(12.w),
              margin: EdgeInsets.symmetric(horizontal: 10.h),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(16)).w,
              ),
              //Container's child is a Row that has a List of the BottomNavBar Icons ...
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //BottomNav Bar Icons....
                  BottomNavBar(

                    onTap: () {

                      mainScreenNotifierValue.pageIndex = 0;

                    },
                    icon: Icons.home,
                  ),
                  BottomNavBar(
                    onTap: () {
                      mainScreenNotifierValue.pageIndex = 1;
                    },
                    icon: Icons.search,
                  ),
                  BottomNavBar(
                    onTap: () {
                      mainScreenNotifierValue.pageIndex = 2;
                    },
                    icon: Ionicons.add,
                  ),
                  BottomNavBar(
                    onTap: () {
                      mainScreenNotifierValue.pageIndex = 3;
                    },
                    icon: Ionicons.cart,
                  ),
                  BottomNavBar(
                    onTap: () {
                      mainScreenNotifierValue.pageIndex = 4;
                    },
                    icon: Ionicons.person,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
