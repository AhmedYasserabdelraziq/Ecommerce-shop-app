import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../model/products.dart';
import '../../../widget/card_product.dart';

class ElectronicsProduct extends StatefulWidget {
  const ElectronicsProduct({super.key});

  @override
  State<ElectronicsProduct> createState() => _ElectronicsProductState();
}

class _ElectronicsProductState extends State<ElectronicsProduct> {
  var isLoading = true;
  List<Product> _electronicaProduct = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final url = Uri.https(api, electronicProduct);
    final response = await http.get(url);

    if (response.body == 'null') {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final List<dynamic> electronicData = json.decode(response.body.toString());
    final List<Product> loadedItems = [];
    for (final item in electronicData) {
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
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _electronicaProduct = loadedItems;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?const Center(child:  CircularProgressIndicator()):GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .6,
        ),
        children: [
          for (final card in _electronicaProduct)
            CardProduct(nProduct: card,)
        ]);
  }
}
