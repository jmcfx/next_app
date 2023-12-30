import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomSpacer extends StatefulWidget {
  const CustomSpacer({super.key});

  @override
  State<CustomSpacer> createState() => _CustomSpacerState();
}

class _CustomSpacerState extends State<CustomSpacer> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 25.h,
    );
  }
}
