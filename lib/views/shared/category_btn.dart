// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/views/shared/app_style.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.onPress,
    required this.label,
    required this.buttonClr,
  });
  final String label;
  final Color buttonClr;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        height: 40.h,
        width: MediaQuery.of(context).size.width * 0.24.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.r,
            color: buttonClr,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(9.r)),
        ),
        child: Center(
          child: Text(
            label,
            style: appStyle(
              fontSize: 15.sp,
              color: buttonClr,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
