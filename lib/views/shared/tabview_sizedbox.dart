//Tab View Container Widget...
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_app/models.dart/sneakers_model.dart';
import 'package:next_app/views/navUi/product_page.dart';
import 'package:next_app/views/shared/product_card.dart';

class TabViewSizedBox extends StatelessWidget {
  const TabViewSizedBox({
    super.key,
    required this.future,
  });
  final Future<List<Sneakers>> future;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.37.h,
      width: MediaQuery.of(context).size.width.w,
      child: FutureBuilder<List<Sneakers>>(
        future: future,
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(id: shoe.id, category: shoe.category),
                      ),
                    );
                  },
                  child: ProductCard(
                    image: shoe.imageUrl[0],
                    price: "\$${shoe.price}",
                    category: shoe.category,
                    id: shoe.id,
                    name: shoe.name,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
