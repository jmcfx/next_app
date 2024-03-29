// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/models.dart/sneakers_model.dart';
import 'package:next_app/views/navUi/product_by_cart.dart';
import 'package:next_app/views/shared/app_style.dart';
import 'package:next_app/views/shared/new_shoes.dart';
import 'package:next_app/views/shared/tabview_sizedbox.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.tabIndex,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        //Men Shoes Tab View...
        TabViewSizedBox(
          future: _male,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: appStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductByCart(
                            tabIndex: tabIndex,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(CommunityMaterialIcons.skip_next, size: 20.sp),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //List of Shoes...
        Padding(
          padding: const  EdgeInsets.all(0.5).r,
          child: SizedBox(
            height:  99.h,
            child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.hasError}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(7.0).r,
                        child: NewShoes(
                          imageUrl: shoe.imageUrl[0],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
