import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../locator.dart';
import '../../../model/api.dart';
import '../../../model/products.dart';
import '../../../widget/card_product.dart';

class WomenProduct extends StatefulWidget {
  const WomenProduct({super.key});

  @override
  State<WomenProduct> createState() => _WomenProductState();
}

class _WomenProductState extends State<WomenProduct> {
  var isLoading = true;
  List<Product> _womenProduct = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    _womenProduct = await locator.get<Api>().getData(womenProduct);
    if (_womenProduct.isNotEmpty) {
      if (!mounted) {
        return;
      }setState(() {
        isLoading = false;
      });
    }

  }

  // void getData() async {
  //   final url = Uri.https(api, womenProduct);
  //   final response = await http.get(url);
  //
  //   if (response.body == 'null') {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     return;
  //   }
  //
  //   final List<dynamic> womenData = json.decode(response.body.toString());
  //   final List<Product> loadedItems = [];
  //   for (final item in womenData) {
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
  //   }if (!mounted) {
  //     return;
  //   }
  //   setState(() {
  //     _womenProduct = loadedItems;
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
                for (final card in _womenProduct)
                  CardProduct(
                    nProduct: card,
                  )
              ]);
  }
}
