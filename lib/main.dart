import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/controllers/main_screen_provider.dart';
import 'package:next_app/views/navUi/main_screen.dart';
import 'dart:developer' show log;
import 'package:provider/provider.dart';

const devTools = log;

void main(List<String> args) {
  runApp(
    // Wrapped MultiProvider Around MyApp.. To make it's Provided instance Accessible to all the descendant in the Widget Three..
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainScreenNotifier(),
        ),
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
