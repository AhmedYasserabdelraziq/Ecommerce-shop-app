import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../model/page_swipe.dart';
import '../../../model/products.dart';
import '../../../widget/card_product.dart';
import 'card_view.dart';
import 'categories.dart';
class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key, required this.snapshot, required this.onSelect,
  });
 final AsyncSnapshot<List<Product>> snapshot;
 final void Function(int num)onSelect;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<int> numb = [1, 2, 3, 4];
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height*.3,
            child: Swiper(
              onTap: (index) => onSelect(numb[index]),
              itemCount: pageView.length,
              pagination: const SwiperPagination(),
              duration: 650,
              autoplay: true,
              itemBuilder: (ctx, index) {
                return CardView(
                  swipe: pageView[index],);
              },
            ),
          ),
          SizedBox(
            height: size.height*0.05,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Categories',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height*0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Categories(onSelect: onSelect, snapshot: snapshot),
              ),
            ),
          ),
          SizedBox(
            height: size.height*0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Popular Now',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black,),
                  ),
                ),
                TextButton(
                  onPressed: () => onSelect(0),
                  child: const Text('View all'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: size.height*.4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return CardProduct(
                    nProduct: snapshot.data![Random().nextInt(20)],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
