// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.imageUrl,
  });
 final String  imageUrl ;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            const Radius.circular(10).r,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 0.1.r,
              blurRadius: 0.7.r,
              offset:  Offset(0.r, 1.r),
            )
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.12.h,
        width: MediaQuery.of(context).size.width * 0.30.w,
        child:   CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            width:
               MediaQuery.of(context).size.width * 0.5,
           placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
               color: Colors.grey.withOpacity(0.2),
             ),
          ),
          errorWidget: (context, url, error) =>
               const Icon(Icons.error),
          )

    );
  }
}
