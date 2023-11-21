import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/shared/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            //Container......
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
              child: Container(
                padding: EdgeInsets.only(left: 8.w, bottom: 16.h),
                width: MediaQuery.of(context).size.width.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Athletics Shoes",
                      style: appStyleWithHeight(
                          fontSize: 42.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5.h),
                    ),
                    Text(
                      "Collection",
                      style: appStyleWithHeight(
                          fontSize: 42.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.2.h),
                    ),
                    // TabBar Takes  List of Tabs in the Column....
                    TabBar(
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
                      tabs: const [
                        Tab(text: "Men Shoes"),
                        Tab(text: "Women Shoes"),
                        Tab(text: "Kids Shoes"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Children of the Stacked....
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.21.h),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                padding: EdgeInsets.only(left: 11.w),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        //Men Shoes Tab View...
                        const TabviewSizedBox(),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10).r,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Latest Shoes",
                                    style: appStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Show All",
                                        style: appStyle(
                                            fontSize: 18.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Icon(CommunityMaterialIcons.skip_next,
                                          size: 20.sp),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        //List of Shoes 
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13.h,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(6.1).r,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      const Radius.circular(10).r,
                                    ),
                                    boxShadow:  [
                                      BoxShadow(
                                        color: Colors.black38,
                                        spreadRadius: 0.1.r,
                                        blurRadius: 0.7.r,
                                        offset: const  Offset(0,1)
                                      )
                                    ],
                                  ),
                                  height: MediaQuery.of(context).size.height *
                                      0.12.h,
                                  width: MediaQuery.of(context).size.width *
                                      0.30.w,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                      //  "https://png.pngitem.com/pimgs/s/680-6807721_vans-oldskool-shoes-sneakers-tumblr-trend-niche-popular.png",
                                   "https://media.istockphoto.com/id/1629114862/photo/close-up-of-white-sports-shoes-on-a-white-background.webp?b=1&s=170667a&w=0&k=20&c=xJnzhqYgVTrLE_d3OB5FCAq34UBvYKCq3PgPUkrxjeM=",
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
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const Column(
                      children: [
                        //Women Shoes Tab View....
                        TabviewSizedBox(),
                      ],
                    ),
                    const Column(
                      children: [
                        //Kid Shoes Tab View.....
                        TabviewSizedBox()
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Tab View Container Widget...
class TabviewSizedBox extends StatelessWidget {
  const TabviewSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.37.h,
      width: MediaQuery.of(context).size.width.w,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6).r,
            child: Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height.h,
                width: MediaQuery.of(context).size.width * 0.5.w),
          );
        },
      ),
    );
  }
}
