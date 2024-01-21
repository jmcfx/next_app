import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:next_app/controllers/favorites_provider.dart';
import 'package:next_app/views/navUi/main_screen.dart';
import 'package:next_app/views/shared/app_style.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  
  

  @override
  Widget build(BuildContext context) {
    var favoriteNotifier = Provider.of<FavoritesNotifier>(context);
    favoriteNotifier.getAllData();
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height.h,
          width: MediaQuery.of(context).size.width.w,
          child: Stack(
            children: [
              Container(
                padding: customLTRB(left: 16, top: 40, right: 0, bottom: 0),
                height: MediaQuery.of(context).size.height * 0.4.h,
                width: MediaQuery.of(context).size.width.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(130).r,
                    bottomLeft: const Radius.elliptical(1, 20).r,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7).r,
                  child: Text(
                    "My favorites",
                    style: appStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // favorite Image List....
              Padding(
                padding: const EdgeInsets.all(8).r,
                child: ListView.builder(
                  itemCount: favoriteNotifier.fav.length,
                  padding: const EdgeInsets.only(top: 100).r,
                  itemBuilder: (BuildContext context, int index) {
                    final shoe = favoriteNotifier.fav[index];
                    return Padding(
                      padding: const EdgeInsets.all(8).r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          const Radius.circular(10).r,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11.h,
                          width: MediaQuery.of(context).size.width.w,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              spreadRadius: 5.r,
                              blurRadius: 0.3.r,
                              offset: Offset(0.r, 1.r),
                            )
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12).r,
                                    child: CachedNetworkImage(
                                      imageUrl: shoe["imageUrl"],
                                      width: 65.w,
                                      height: 65.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.r,
                                      left: 18.r,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          shoe["name"],
                                          style: appStyle(
                                            fontSize: 13.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Text(
                                          shoe["category"],
                                          style: appStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${shoe["price"]}',
                                              style: appStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7).r,
                                child: GestureDetector(
                                  onTap: () {
                                    favoriteNotifier.deleteFav(shoe["key"]);
                                    favoriteNotifier.ids.removeWhere(
                                        (element) => element == shoe["id"]);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  },
                                  child: const Icon(Ionicons.heart_dislike),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
