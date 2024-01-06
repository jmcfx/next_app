import 'package:flutter/material.dart';
import 'package:next_app/controllers/main_screen_provider.dart';
import 'package:next_app/views/navUi/cart_page.dart';
import 'package:next_app/views/navUi/home_page.dart';
import 'package:next_app/views/navUi/profile_page.dart';
import 'package:next_app/views/navUi/search_page.dart';
import 'package:next_app/views/shared/bottom_nav_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  // List of Navigation UI......
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
    
    // This consumer is Listening to Only MainScreenNotifier Change in State...It then triggers a reBuild in the UI when there is a change in the PageIndex...
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) => Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SafeArea(
    
          child: pageList[mainScreenNotifier.pageIndex],
        ),
        bottomNavigationBar: const BottomNavBarModel(),
      ),
    );
  }
}
