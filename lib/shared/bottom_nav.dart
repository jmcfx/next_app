import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//BottomNavBar Widget
class BottomNavBarIcons extends StatelessWidget {
  const BottomNavBarIcons({
    super.key,
    this.onTap,
    this.icon,
  });
  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36.h,
        width: 36.w,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
