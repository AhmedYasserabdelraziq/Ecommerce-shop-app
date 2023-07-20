import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../model/products.dart';
import '../../../widget/card_product.dart';

class MensProduct extends StatefulWidget {
  const MensProduct({super.key});

  @override
  State<MensProduct> createState() => _MensProductState();
}

class _MensProductState extends State<MensProduct> {
  var isLoading = true;
  List<Product> _mensProduct = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final url = Uri.https(api, mensProduct);
    final response = await http.get(url);

    if (response.body == 'null') {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final List<dynamic> menData = json.decode(response.body.toString());
    final List<Product> loadedItems = [];
    for (final item in menData) {
      final rating = item['rating'];
      loadedItems.add(
        Product(
            id: item['id'],
            title: item['title'],
            price: item['price'],
            description: item['description'],
            category: item['category'],
            image: item['image'],
            rating: Rating(rate: rating['rate'], count: rating['count'])),
      );
    }if (!mounted) {
      return;
    }
    setState(() {
      _mensProduct = loadedItems;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .6,
            ),
            children: [
                for (final card in _mensProduct) CardProduct(nProduct: card,)
              ]);
  }
}
