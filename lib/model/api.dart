import 'dart:convert';

import 'package:api/model/products.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class Api {
 Future <List<Product>> getData(String typeOfProduct) async {
    final url = Uri.https(api, typeOfProduct);
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Please try again later.');
    }
if(response.body=='null'){
  return [];
}
    final List<dynamic> allData = json.decode(response.body.toString());
    final List<Product> loadedItems = [];
    for (final item in allData) {
      final rating = item['rating'];
      loadedItems.add(
        Product(
          id: item['id'],
          title: item['title'],
          price: item['price'],
          description: item['description'],
          category: item['category'],
          image: item['image'],
          rating: Rating(
            rate: rating['rate'],
            count: rating['count'],
          ),
        ),
      );
    }
    return loadedItems;
  }
}
