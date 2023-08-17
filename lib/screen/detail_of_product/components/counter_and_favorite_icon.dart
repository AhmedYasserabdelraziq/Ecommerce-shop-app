import 'package:api/controller/providers/select_categories.dart';
import 'package:api/model/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/providers/favorite_provider.dart';
import '../../../widget/button_style_counter.dart';

class CartCounterAndFavoriteIcon extends ConsumerStatefulWidget {
  const CartCounterAndFavoriteIcon( {required this.onSelect,
    required this.product,
    super.key,
  });
  final void Function(int number)onSelect;
  final Product product;

  @override
  ConsumerState<CartCounterAndFavoriteIcon> createState() =>
      _CartCounterAndFavoriteIconState();
}

class _CartCounterAndFavoriteIconState
    extends ConsumerState<CartCounterAndFavoriteIcon> {
  int showNumber = 0;
  int number = 0;
@override

  @override
  Widget build(BuildContext context) {
    int numberOfCounter = widget.product.rating.count;
    updateNumbers({required int increment}) {
      int num = widget.product.rating.count;

      numberOfCounter = numberOfCounter - increment;
      print(numberOfCounter);
      showNumber = num - numberOfCounter;
    }


    final favoriteMeal = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeal.contains(widget.product);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Column(
        children: [
          Text(
            numberOfCounter.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            children: [
              ButtonStyleCounter(
                  icon: const Icon(Icons.remove),
                  press: () {
                    setState(() {
                      number--;
                      updateNumbers(
                        increment: number,
                      );
                    });

                    // if (ref.watch(addNum) > 1) {
                    //   ref.read(addNum.notifier).updateNumbers(increment: number);
                    // }
                  }),
              Text(
                // AddNumber.get(context)
                //     .setNumber(0)
                //     .toString()
                //     .padLeft(2, '0'),
                showNumber.toString().padLeft(2, '0'),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 25),
              ),
              ButtonStyleCounter(
                  icon: const Icon(Icons.add),
                  press: () {
                    setState(() {
                      number++;
                    });
                    updateNumbers(
                      increment: number,
                    );
                    //ref.read(addNum.notifier).updateNumbers(increment: number);
                  }),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {
                  ref
                      .read(favoriteMealProvider.notifier)
                      .toggleMealFavoriteStatus(widget.product);
                },
                icon: isFavorite
                    ? const Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                      )
                    : const Icon(
                        CupertinoIcons.heart,
                        color: Colors.red,
                      ),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
