import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/products.dart';
class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rating',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 20, color: Colors.white),
        ),
        Row(
          children: [
            Text(
              "${product.rating.rate}",
              style: GoogleFonts.brawler(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              children: List.generate(
                5,
                    (index) => const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
