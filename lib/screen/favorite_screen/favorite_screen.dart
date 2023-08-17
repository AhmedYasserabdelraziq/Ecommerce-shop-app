import 'package:api/controller/providers/favorite_provider.dart';
import 'package:api/screen/cart_screen/components/cart_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'favorite_cart.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(favoriteMealProvider);
    Widget content = Center(
        child: Text(
      'No Favorite added yet',
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    ));

    if (favoriteList.isNotEmpty) {
      content = ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (ctx, index) {
            return FavoriteCart(product: favoriteList[index]);
          });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyFavorite',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
      body: content,
    );
  }
}
