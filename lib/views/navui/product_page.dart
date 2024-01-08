import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:next_app/controllers/product_provider.dart';
import 'package:next_app/models.dart/sneakers_model.dart';
import 'package:next_app/services/helper.dart';
import 'package:next_app/views/shared/app_style.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});
  final String id, category;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();
  late Future<Sneakers> _sneakers;
  void getShoes() {
    if (widget.category == "Men's Running") {
      _sneakers = Helper().getFemaleSneakersById(widget.id);
    } else if (widget.category == "Men Running ") {
      _sneakers = Helper().getFemaleSneakersById(widget.id);
    } else {
      _sneakers = Helper().getKidSneakersById(widget.id);
    }
  }

  @override
  void initState() {
    super.initState();
    getShoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Sneakers>(
        future: _sneakers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.hasError}");
          } else {
            final sneakers = snapshot.data;
            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding:
                            const EdgeInsets.only(left: 1.0, bottom: 37.0).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                productNotifier.shoeSizes.clear();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Ionicons.ellipsis_horizontal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height.h,
                      flexibleSpace: FlexibleSpaceBar(
                        //MainStack......
                        background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.49,
                              width: MediaQuery.of(context).size.width.w,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sneakers!.imageUrl.length,
                                controller: pageController,
                                onPageChanged: (page) {
                                  productNotifier.activePage = page;
                                },
                                itemBuilder: (context, int index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                39.h,
                                        width:
                                            MediaQuery.of(context).size.width.w,
                                        color:
                                            Colors.blueGrey.withOpacity(0.15),
                                        child: CachedNetworkImage(
                                          imageUrl: sneakers.imageUrl[index],
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      Positioned(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.11.h,
                                        right: 16.w,
                                        child: const Icon(
                                            CommunityMaterialIcons
                                                .heart_outline,
                                            color: Colors.grey),
                                      ),
                                      Positioned(
                                        bottom: 0.r,
                                        right: 0.r,
                                        left: 0.r,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List<Widget>.generate(
                                            sneakers.imageUrl.length,
                                            (index) => Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4.h,
                                              ),
                                              child: CircleAvatar(
                                                radius: 5.r,
                                                backgroundColor: productNotifier
                                                            .activePage !=
                                                        index
                                                    ? Colors.grey
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 30.h,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ).r,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.60.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12).r,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sneakers.name,
                                          style: appStyle(
                                            fontSize: 36.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              sneakers.category,
                                              style: appStyle(
                                                fontSize: 17.sp,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                              height: 20.h,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 4.r,
                                              minRating: 1.r,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 22.r,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                          horizontal: 1)
                                                      .r,
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                size: 20.sp,
                                                color: Colors.black,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$${sneakers.price}",
                                              style: appStyle(
                                                fontSize: 26.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Colors",
                                                  style: appStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                CircleAvatar(
                                                  radius: 7.r,
                                                  backgroundColor: Colors.black,
                                                ),
                                                CircleAvatar(
                                                  radius: 7.r,
                                                  backgroundColor: Colors.black,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Select sizes",
                                                  style: appStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                Text(
                                                  "View size guide",
                                                  style: appStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            SizedBox(
                                              height: 40.h,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                padding: EdgeInsets.zero,
                                                itemCount: productNotifier
                                                    .shoeSizes.length,
                                                itemBuilder: (context, index) {
                                                  return ChoiceChip(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                      side: BorderSide(
                                                        color: Colors.black,
                                                        width: 1.w,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
                                                    ),
                                                    label:Text(productNotifier.shoeSizes[index]["size"], style: appStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w500)) ,
                                                    selected: productNotifier.shoeSizes[index]["isSelected"],
                                                    
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
