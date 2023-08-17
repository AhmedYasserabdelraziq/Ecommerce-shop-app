import 'package:api/screen/detail_of_product/components/rating_widget.dart';
import 'package:flutter/material.dart';

import '../../../model/products.dart';
import 'add_to_cart.dart';
import 'counter_and_favorite_icon.dart';

class BodyOfContainer extends StatefulWidget {
  const BodyOfContainer({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<BodyOfContainer> createState() => _BodyOfContainerState();
}

class _BodyOfContainerState extends State<BodyOfContainer> {
  @override
  Widget build(BuildContext context) {
    int n=0;

  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingWidget(product: widget.product),
        const SizedBox(height: 12.0),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              widget.product.description,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ), CartCounterAndFavoriteIcon(product: widget.product, onSelect: (int number) {
          setState(() {

          n=number;
          print(n);
          });
          },),
        AddToCart(product: widget.product, number:n,)
      ],
    );
  }
}
