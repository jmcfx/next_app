// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/views/shared/app_style.dart';

class ProductCard extends StatefulWidget {
   const ProductCard({
    super.key,
    required this.image, required this.price, required this.category, required this.id, required this.name,
  });

  final String price, category, id, name, image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
 
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0).r,
      child: ClipRRect(
        borderRadius:   BorderRadius.all(const Radius.circular(16).r),
        child: Container(
          height: MediaQuery.of(context).size.height.h,
          width: MediaQuery.of(context).size.width * 0.6.w,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1.r,
                blurRadius: 0.6.r,
                offset: Offset(1.r, 1.r),
              )
            ]

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:NetworkImage(widget.image) ,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(CommunityMaterialIcons.heart_outline),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appStyleWithHeight(
                        fontSize: 30.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1.1.h,
                      ),
                    ),
                    Text(
                      widget.category,
                      style: appStyleWithHeight(
                        fontSize: 18.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        height: 1.5.h,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: appStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          "Color",
                          style: appStyle(
                              fontSize: 18.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ChoiceChip(
                          label: const Text(""),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Colors.white, 
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
