import 'dart:convert';

import 'package:api/model/cart.dart';
import 'package:api/providers/add_to_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import 'components/cart_details.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  List<MyCart> carts = [];

  @override
  void initState() {
    getCart();
    super.initState();
  }

  void getCart() async {
    final url = Uri.https(api, cart);
    final response = await http.get(url);
    final List<dynamic> getCart = json.decode(response.body);
    print(getCart);
    List<MyCart> loadedCart = [];
    for (final item in getCart) {
      final productCart = item['products'];
      final List<Products> myProduct = [];
      for (final item in productCart) {
        myProduct.add(
            Products(productId: item['productId'], quantity: item['quantity']));
      }
      loadedCart.add(
        MyCart(
          id: item['id'],
          userId: item['userId'],
          date: item['date'],
          products: myProduct,
        ),
      );
    }
    if (!mounted) {
      return;
    }
    setState(() {
      carts = loadedCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listProduct = ref.watch(addList);
    Widget content = Center(
        child: Text(
      'No Carts added yet.',
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    ));
    if (listProduct.isNotEmpty) {
      content = Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: listProduct.length,
                itemBuilder: (ctx, index) {
                  return CartDetails(
                    product: listProduct[index],
                  );
                }),
          ),
          const Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Text('Total Amount'),
              //Text(data)
              ],
            ),
          )
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: content,
    );
  }
}
