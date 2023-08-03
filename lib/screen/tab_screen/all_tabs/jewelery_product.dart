import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../locator.dart';
import '../../../model/api.dart';
import '../../../model/products.dart';
import '../../../widget/card_product.dart';

class JeweleryProduct extends StatefulWidget {
  const JeweleryProduct({super.key});

  @override
  State<JeweleryProduct> createState() => _JeweleryProductState();
}

class _JeweleryProductState extends State<JeweleryProduct> {
  var isLoading = true;
  List<Product> _jeweleryProduct = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    _jeweleryProduct = await locator.get<Api>().getData(jeweleryProduct);
    if (_jeweleryProduct.isNotEmpty) {
      if (!mounted) {
        return;
      }setState(() {
        isLoading = false;
      });
    }
  }

  // void getData() async {
  //   final url = Uri.https(api, jeweleryProduct);
  //   final response = await http.get(url);
  //
  //   if (response.body == 'null') {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     return;
  //   }
  //
  //   final List<dynamic> jeweleryData = json.decode(response.body.toString());
  //   final List<Product> loadedItems = [];
  //   for (final item in jeweleryData) {
  //     final rating = item['rating'];
  //     loadedItems.add(
  //       Product(
  //           id: item['id'],
  //           title: item['title'],
  //           price: item['price'],
  //           description: item['description'],
  //           category: item['category'],
  //           image: item['image'],
  //           rating: Rating(rate: rating['rate'], count: rating['count'])),
  //     );
   // }
  //   setState(() {
  //     _jeweleryProduct = loadedItems;
  //     isLoading = false;
  //   });
  // }
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
                for (final card in _jeweleryProduct)
                  CardProduct(
                    nProduct: card,
                  )
              ]);
  }
}
