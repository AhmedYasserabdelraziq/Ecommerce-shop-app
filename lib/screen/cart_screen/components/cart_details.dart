import 'package:api/screen/cart_screen/components/texts_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/providers/add_to_list.dart';
import '../../../model/products.dart';

class CartDetails extends ConsumerWidget {
  const CartDetails({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 150,
      height: 166,
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
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextsDetail(product: product),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: IconButton(
              onPressed: () {
                ref.watch(addList.notifier).remove(product);
              },
              icon: const Icon(
                Icons.delete,
                size: 40,
                color: Colors.red,
              ),
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
