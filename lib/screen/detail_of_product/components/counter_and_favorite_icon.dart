import 'package:api/bloc/states.dart';
import 'package:api/model/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/cubit.dart';
import '../../../providers/favorite_provider.dart';
import '../../../widget/button_style_counter.dart';

class CartCounterAndFavoriteIcon extends ConsumerStatefulWidget {
  const CartCounterAndFavoriteIcon({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  ConsumerState<CartCounterAndFavoriteIcon> createState() =>
      _CartCounterAndFavoriteIconState();
}

class _CartCounterAndFavoriteIconState
    extends ConsumerState<CartCounterAndFavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    final favoriteMeal = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeal.contains(widget.product);
    //List<int> numberOfCounter = ref.watch(addNum);
    return BlocProvider(
      create: (BuildContext context) => AddNumber(),
      child: BlocConsumer<AddNumber, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ButtonStyleCounter(
                          icon: const Icon(Icons.remove),
                          press: () {
                            AddNumber.get(context).minus();
                            //    if (numberOfCounter[0] > 1) {
                            //      ref.watch(addNum);
                            //  }
                          }),
                      Text(
                        AddNumber.get(context)
                            .number
                            .toString()
                            .padLeft(2, '0'),
                        //numberOfCounter.toString().padLeft(2, '0'),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 25),
                      ),
                      ButtonStyleCounter(
                          icon: const Icon(Icons.add),
                          press: () {
                            AddNumber.get(context).plus();
                            //  ref.watch(addNum.notifier).increment();
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
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
