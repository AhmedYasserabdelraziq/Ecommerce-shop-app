import 'package:api/locator.dart';
import 'package:api/model/api.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/products.dart';
import '../../../widget/card_product.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  var isLoading = true;
  List<Product> _allProduct = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    _allProduct = await locator.get<Api>().getData(allProduct);
    if (_allProduct.isNotEmpty) {
      if (!mounted) {
        return;
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  // void getData() async {
  //   final url = Uri.https(api, allProduct);
  //   final response = await http.get(url);
  //
  //   if (response.body == 'null') {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     return;
  //   }
  //
  //   final List<dynamic> allData = json.decode(response.body.toString());
  //   final List<Product> loadedItems = [];
  //   for (final item in allData) {
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
  //     _allProduct = loadedItems;
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
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            children: [
                for (final card in _allProduct)
                  CardProduct(
                    nProduct: card,
                  )
              ]);
  }
}
