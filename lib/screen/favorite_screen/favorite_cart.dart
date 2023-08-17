import 'package:api/model/products.dart';
import 'package:api/controller/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteCart extends ConsumerWidget {
  const FavoriteCart({super.key, required this.product});
final Product product;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(10),
      // height: 140,
      decoration: BoxDecoration(
        border:
        Border.all(width: 2, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  height: 140,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
              const SizedBox(
                height: 5,
              ),
              Text(
                product.category,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(product.rating.rate.toString(),style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
                const Icon(Icons.star,color:Colors.amberAccent
                  ,)
                ],
              ),
              Text(
                "\$${product.price}",
                style: GoogleFonts.brawler(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: IconButton(
              onPressed: () {
                ref.watch(favoriteMealProvider.notifier).toggleMealFavoriteStatus(product);
              },
              icon: const Icon(
                Icons.delete,
                size: 40,
                color: Colors.red,
              ),color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
