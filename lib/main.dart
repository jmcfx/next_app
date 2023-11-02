import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/shared/app_style.dart';

void main(List<String> args) {
  runApp(const MyApp());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "MainScreen",
            style: appStyle(
                fontSize: 40.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.w.h),
          child: Container(
             padding: EdgeInsets.all(12.w),
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: const BorderRadius.all(Radius.circular(16)).w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 36.h,
                  width: 36.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
