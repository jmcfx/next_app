// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/views/shared/app_style.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
  final String imageUrl, name, price;

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(const Radius.circular(16).h),  
      ),
      child: Padding(
        padding: const EdgeInsets.all(8).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageUrl,
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.only(top: 12).r,
              height: 75.r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: appStyleWithHeight(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        height: 1.h),
                  ), 
                  Text(
                    widget.price,
                    style: appStyleWithHeight(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        height: 1.h),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
