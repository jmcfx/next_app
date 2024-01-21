import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_app/controllers/cart_provider.dart';
import 'package:next_app/controllers/favorites_provider.dart';
import 'package:next_app/controllers/main_screen_provider.dart';
import 'package:next_app/controllers/product_provider.dart';
import 'package:next_app/views/navUi/main_screen.dart';
import 'dart:developer' show log;
import 'package:provider/provider.dart';

const devTools = log;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("cart_box");
  await Hive.openBox("fav_box");

  runApp(
    // Wrapped MultiProvider Around MyApp.. To make it's Provided instance Accessible to all the descendant in the Widget Three..
    MultiProvider(
      providers: [
        //MainScreenNotifier Provider...
        ChangeNotifierProvider(
          create: (context) => MainScreenNotifier(),
        ),
        // ProductNotifier Provider...
        ChangeNotifierProvider(create: (context) => ProductNotifier()),
        //FavoritesNotifier Provider...
        ChangeNotifierProvider(create: (context) => FavoritesNotifier()),
        //CartNotifier Provider.....
        ChangeNotifierProvider(create: (context)=> CartProvider()),
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
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        //Screen Util returns MaterialApp..
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //MainScreen.....
          home: MainScreen(),
        );
      },
    );
  }
}