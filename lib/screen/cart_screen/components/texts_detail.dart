import 'package:api/controller/providers/select_categories.dart';
import 'package:api/widget/button_style_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/products.dart';

class TextsDetail extends ConsumerStatefulWidget {
  const TextsDetail({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  ConsumerState<TextsDetail> createState() => _TextsDetailState();
}

class _TextsDetailState extends ConsumerState<TextsDetail> {


  @override
  Widget build(BuildContext context) {
    int number = ref.watch(addNum)[0];

    // int numberOfCounter = ref.watch(addNum);
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
            // ButtonStyleCounter(
            //     icon: const Icon(Icons.remove),
            //     press: () {
            //       number--;
            //     }),
            Text(
              number.toString().padLeft(2, '0'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            // ButtonStyleCounter(
            //     icon: const Icon(Icons.add),
            //     press: () {
            //       number++;
            //     }),
          ],
        )
      ],
    );
  }
}
