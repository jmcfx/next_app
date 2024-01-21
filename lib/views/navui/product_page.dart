import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:next_app/controllers/cart_provider.dart';
import 'package:next_app/controllers/favorites_provider.dart';
import 'package:next_app/controllers/product_provider.dart';
import 'package:next_app/models.dart/sneakers_model.dart';
import 'package:next_app/views/navUi/favorites.dart';
import 'package:next_app/views/shared/app_style.dart';
import 'package:next_app/views/shared/check_out_button.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});
  final String id, category;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // pageController.....
  final PageController pageController = PageController();
  // cartBox....

  @override
  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getShoes(widget.category, widget.id);
    var cartprovider = Provider.of<CartProvider>(context);
    cartprovider.getCart();

    var favoritesNotifier =
        Provider.of<FavoritesNotifier>(context, listen: true);
    favoritesNotifier.getFavorites();
    return Scaffold(
      body: FutureBuilder<Sneakers>(
        future: productNotifier.sneakers,
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
                                        child: Consumer<FavoritesNotifier>(
                                            builder: (context,
                                                favoritesNotifier, child) {
                                          return GestureDetector(
                                              onTap: () {
                                                if (favoritesNotifier.ids
                                                    .contains(widget.id)) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Favorites()));
                                                } else {
                                                  favoritesNotifier.getAllData()({
                                                    "id": sneakers.id,
                                                    "name": sneakers.name,
                                                    "category":
                                                        sneakers.category,
                                                    "price": sneakers.price,
                                                    "imageUrl":
                                                        sneakers.imageUrl[0],
                                                  });
                                                }
                                                setState(() {});
                                              },
                                              child: favoritesNotifier.ids
                                                      .contains(sneakers.id)
                                                  ? const Icon(
                                                      CommunityMaterialIcons
                                                          .heart)
                                                  : const Icon(
                                                      CommunityMaterialIcons
                                                          .heart_outline));
                                        }),
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
                                            height: 15.h,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 7.r,
                                                    backgroundColor:
                                                        Colors.black,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 7.r,
                                                    backgroundColor:
                                                        Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 13.h,
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              SizedBox(
                                                height: 40.h,
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.zero,
                                                  itemCount: productNotifier
                                                      .shoeSizes.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    // Product Notifier.shoeSizes
                                                    final sizes =
                                                        productNotifier
                                                            .shoeSizes[index];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 7.0.r,
                                                      ),
                                                      child: ChoiceChip(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            60,
                                                          ).r,
                                                          side: BorderSide(
                                                            color: Colors.black,
                                                            width: 1.w,
                                                            style: BorderStyle
                                                                .solid,
                                                          ),
                                                        ),
                                                        disabledColor:
                                                            Colors.white,
                                                        label: Text(
                                                          sizes['size'],
                                                          style: appStyle(
                                                            fontSize: 13.sp,
                                                            color: sizes[
                                                                    'isSelected']
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        selectedColor:
                                                            Colors.black,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 8)
                                                                .r,
                                                        selected:
                                                            sizes['isSelected'],
                                                        onSelected: (newState) {
                                                          if (productNotifier
                                                              .sizes
                                                              .contains(sizes[
                                                                  "size"])) {
                                                            productNotifier
                                                                .sizes
                                                                .remove(sizes[
                                                                    "size"]);
                                                          } else {
                                                            productNotifier
                                                                .sizes
                                                                .add(sizes[
                                                                    "size"]);
                                                          }
                                                          print(productNotifier
                                                              .sizes);
                                                          productNotifier
                                                              .toggleCheck(
                                                                  index);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Divider(
                                              indent: 10.w,
                                              endIndent: 10.w,
                                              color: Colors.black38),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7.w,
                                            child: Text(
                                              sneakers.title,
                                              style: appStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8.w,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            sneakers.description,
                                            textAlign: TextAlign.justify,
                                            maxLines: 4,
                                            style: appStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 12)
                                                      .r,
                                              child: CheckOutButton(
                                                  onTap: () async {
                                                    favoritesNotifier.getAllData()(
                                                      {
                                                        "id": sneakers.id,
                                                        "name": sneakers.name,
                                                        "category":
                                                            sneakers.category,
                                                        "sizes": productNotifier
                                                            .sizes,
                                                        "imageUrl": sneakers
                                                            .imageUrl[0],
                                                        "price": sneakers.price,
                                                        "qty": 1,
                                                      },
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  label: "Add to Cart"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
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
