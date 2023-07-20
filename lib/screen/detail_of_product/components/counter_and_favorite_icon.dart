import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/select_categories.dart';
import '../../../widget/button_style_counter.dart';

class CartCounterAndFavoriteIcon extends ConsumerStatefulWidget {
  const CartCounterAndFavoriteIcon({
    super.key,
  });

  @override
  ConsumerState<CartCounterAndFavoriteIcon> createState() =>
      _CartCounterAndFavoriteIconState();
}

class _CartCounterAndFavoriteIconState
    extends ConsumerState<CartCounterAndFavoriteIcon> {
  int numberOfCounter = 1;

  @override
  Widget build(BuildContext context) {
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
                      setState(() {
                        if (numberOfCounter > 1) {
                          numberOfCounter--;
                        }
                      });
                    }),
                Text(
                  numberOfCounter.toString().padLeft(2, '0'),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 25),
                ),
                ButtonStyleCounter(
                    icon: const Icon(Icons.add),
                    press: () {
                      setState(() {
                        numberOfCounter++;
                      });
                    }),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
