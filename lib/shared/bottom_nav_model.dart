import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:next_app/controllers/mainscreen_provider.dart';
import 'package:next_app/shared/app_style.dart';
import 'package:next_app/shared/bottom_nav.dart';
import 'package:provider/provider.dart';

class BottomNavBarModel extends StatelessWidget {
  const BottomNavBarModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) => SafeArea(
        child: Padding(
          padding: customLTRB(left: 8, top: 8, right: 8, bottom: 8),
          child: Container(
            padding: EdgeInsets.all(12.r),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(16)).w),
            //Container's child is a Row that has a List of the BottomNavBar Icons ...
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //BottomNav Bar Icons....
                BottomNavBarIcons(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 0;
                  },
                  icon: mainScreenNotifier.pageIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                ),
                BottomNavBarIcons(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                  },
                  icon: mainScreenNotifier.pageIndex == 1
                      ? Icons.search
                      : Icons.search_outlined,
                ),
                BottomNavBarIcons(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                  },
                  icon: mainScreenNotifier.pageIndex == 2
                      ? Icons.add
                      : Icons.add_outlined,
                ),
                BottomNavBarIcons(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                  },
                  icon: mainScreenNotifier.pageIndex == 3
                      ? Ionicons.cart
                      : Ionicons.cart_outline,
                ),
                BottomNavBarIcons(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 4;
                    },
                    icon: mainScreenNotifier.pageIndex == 4
                        ? Ionicons.person
                        : Ionicons.person_outline)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
