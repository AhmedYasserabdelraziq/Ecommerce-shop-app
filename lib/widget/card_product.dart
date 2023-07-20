import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/products.dart';
import '../screen/detail_of_product/detail_product.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.nProduct,
  });

  final Product nProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 160,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailProduct(
                    product: nProduct,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 7,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        child: Hero(
                          tag: nProduct.id,
                          child: Image.network(
                            nProduct.image,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Flexible(
                  flex: 2,
                  child: productTitle(context),
                ),
                const SizedBox(
                  height: 4,
                ),
                Flexible(
                  flex: 1,
                  child: productPrice(),
                ),
                Flexible(
                  flex: 1,
                  child: rating(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row rating(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Text(
            'Review ${nProduct.rating.rate}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.amberAccent,
        ),
      ],
    );
  }

  Padding productPrice() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        "\$${nProduct.price}",
        style: GoogleFonts.brawler(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding productTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(
        nProduct.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        // textAlign: TextAlign.center,
      ),
    );
  }
}
