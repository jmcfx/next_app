// ignore_for_file: public_member_api_docs, sort_constructors_firs
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/models.dart/sneakers_model.dart';
import 'package:next_app/services/helper.dart';
import 'package:next_app/views/shared/app_style.dart';
import 'package:next_app/views/shared/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            //Container......
            Container(
              padding: customLTRB(left: 16, top: 15, right: 0, bottom: 0),
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
            ),
            //Children of the Stacked....
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.21.h),
              child: Container(
                color: Colors.grey.withOpacity(0.0),
                padding: EdgeInsets.only(left: 11.w),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //Men shoes..
                    HomeWidget(
                      male: _male,
                      tabIndex: 0,
                    ),
                    //Women shoes...
                    HomeWidget(
                      male: _female,
                      tabIndex: 1,
                    ),
                    //kids shoes...
                    HomeWidget(
                      male: _kids,
                      tabIndex: 2,
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
