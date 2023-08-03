import 'package:api/bloc/states.dart';
import 'package:api/locator.dart';
import 'package:api/screen/detail_of_product/components/counter_and_favorite_icon.dart';
import 'package:api/widget/button_style_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/cubit.dart';
import '../../../model/products.dart';

class TextsDetail extends StatefulWidget {
  const TextsDetail({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<TextsDetail> createState() => _TextsDetailState();
}

class _TextsDetailState extends State<TextsDetail> {
  int number = 01;

  @override
  Widget build(BuildContext context) {
    //locator.get<CartCounterAndFavoriteIcon>().product;
   // int numberOfCounter = ref.watch(addNum);
    return BlocProvider(
      create: (BuildContext context) => AddNumber(),
      child: BlocConsumer<AddNumber, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CounterMinusState) {
            number = state.num;
            print(state.num);
          }
          if (state is CounterPlusState) {
            number = state.num;
            print(state.num);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.title,
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
                widget.product.category,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Text(
                  "\$${widget.product.price}",
                  style: GoogleFonts.brawler(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Row(
                children: [
                  ButtonStyleCounter(
                      icon: const Icon(Icons.remove),
                      press: () {
                        if (AddNumber.get(context).number > 1) {
                          AddNumber.get(context).minus();
                        }
                      }),
                  Text(
                    AddNumber.get(context).number.toString().padLeft(2, '0'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  ButtonStyleCounter(
                      icon: const Icon(Icons.add),
                      press: () {
                        AddNumber.get(context).plus();
                      }),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
