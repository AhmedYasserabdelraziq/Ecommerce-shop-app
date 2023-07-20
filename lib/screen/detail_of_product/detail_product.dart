import 'package:api/screen/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../model/products.dart';
import 'components/body_of_container.dart';
import 'components/product_title_with_price.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key, required this.product});

  final Product product;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.category,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductTitleWithPrice(product: product),
            Stack(clipBehavior: Clip.none, children: [
              Container(
                padding: EdgeInsets.only(
                  top: size.height * .10,
                  left: 10,
                  right: 10,
                ),
                height: size.height * .59,
                clipBehavior: Clip.none,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: BodyOfContainer(product: product),
              ),
              Positioned(
                right: 25,
                top: -170,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      width: size.width*0.5,
                      height: size.height*.3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
