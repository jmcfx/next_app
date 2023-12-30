import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:next_app/models.dart/sneakers_model.dart';
import 'package:next_app/services/helper.dart';
import 'package:next_app/views/shared/app_style.dart';
import 'package:next_app/views/shared/category_btn.dart';
import 'package:next_app/views/shared/custom_spacer.dart';
import 'package:next_app/views/shared/latest_shoes.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key});

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male, _female, _kids;
  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: customLTRB(left: 16, top: 13, right: 0, bottom: 0),
                height: MediaQuery.of(context).size.height * 0.4.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(140).r,
                    bottomLeft: const Radius.circular(140).r,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          customLTRB(left: 6, top: 10, right: 16, bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(CommunityMaterialIcons.close,
                                color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              filter(context);
                            },
                            child: const Icon(FontAwesomeIcons.sliders,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    TabBar(
                      padding: EdgeInsets.zero,
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3.r),
                      dividerColor: Colors.black,
                      tabAlignment: TabAlignment.center,
                      tabs: const [
                        Tab(text: "Men Shoes"),
                        Tab(text: "Women Shoes"),
                        Tab(text: "Kids Shoes"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.175.h,
                        left: 16.w,
                        right: 12.w)
                    .r,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      LatestShoes(male: _male),
                      LatestShoes(male: _female),
                      LatestShoes(male: _kids),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> filter(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.white54,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.80.h,
      width: MediaQuery.of(context).size.width.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ).r),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 5.h,
            width: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              color: Colors.black38,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7.h,
            child: Column(
              children: [
                const CustomSpacer(),
                Text(
                  "Filter",
                  style: appStyle(
                      fontSize: 30.sp,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold),
                ),
                const CustomSpacer(),
                Text(
                  "Gender",
                  style: appStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    CategoryBtn(
                      onPress: () {},
                      label: "Men",
                      buttonClr: Colors.black,
                    ),
                    CategoryBtn(
                      onPress: () {},
                      label: "Women",
                      buttonClr: Colors.grey,
                    ),
                    CategoryBtn(
                      onPress: () {},
                      label: "Kids",
                      buttonClr: Colors.grey,
                    ),
                  ],
                ),
               const  CustomSpacer(),
                Text(
                  "Category",
                  style: appStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
               SizedBox(
                  height: 20.h,
                ),
                 Row(
                  children: [
                    CategoryBtn(
                      onPress: () {},
                      label: "Women",
                      buttonClr: Colors.black,
                    ),
                    CategoryBtn(
                      onPress: () {},
                      label: "Women",
                      buttonClr: Colors.grey,
                    ),
                    CategoryBtn(
                      onPress: () {},
                      label: "Women",
                      buttonClr: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
