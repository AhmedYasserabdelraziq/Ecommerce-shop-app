import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/providers/add_to_list.dart';
import '../../../controller/providers/select_categories.dart';
import '../../../model/products.dart';


class AddToCart extends ConsumerWidget {
  const AddToCart( {required this.number,
    super.key,
    required this.product,
  });
final int number;
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
                  print(number);

                  ref.read(addNum.notifier).add(number);
                  ref.read(addList.notifier).add(product);
                  //ref.watch(addNum.notifier).reset();
                },
                icon: const Icon(Icons.shopping_cart_checkout,),
                label: const Text('Add to Cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
