import 'package:api/providers/add_to_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/products.dart';


class AddToCart extends ConsumerWidget {
  const AddToCart({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [

          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  ref.read(addList.notifier).add(product);
                },
                icon: const Icon(Icons.shopping_cart_checkout,),
                label: const Text('Add to Cart'),
              ),
            ),
          ), IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.heart,
              color: Colors.red,
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
