import 'package:api/screen/detail_of_product/components/rating_widget.dart';
import 'package:flutter/material.dart';

import '../../../model/products.dart';
import 'add_to_cart.dart';
import 'counter_and_favorite_icon.dart';

class BodyOfContainer extends StatelessWidget {
  const BodyOfContainer({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingWidget(product: product),
        const SizedBox(height: 12.0),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              product.description,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
        AddToCart(product: product,)
      ],
    );
  }
}
