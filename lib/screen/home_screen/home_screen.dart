import 'package:api/model/products.dart';
import 'package:api/screen/cart_screen/cart_screen.dart';
import 'package:api/screen/tab_screen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../locator.dart';
import '../../model/api.dart';
import 'components/body_home.dart';
import 'components/drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future<List<Product>>? _loadedItems;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    _loadedItems = locator.get<Api>().getData(allProduct);
    if (!mounted) {
      return;
    }
  }

  // Future<List<Product>> getData() async {
  //   final url = Uri.https(api, allProduct);
  //   final response = await http.get(url);
  //   if (response.statusCode >= 400) {
  //     throw Exception('Failed to fetch grocery items. Please try again later.');
  //   }
  //   if (response.body == 'null') {
  //     return [];
  //   }
  //
  //   final List<dynamic> allData = json.decode(response.body);
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
  //   }
  //   return loadedItems;
  // }

  void onSelect(int identifier) {
    // ref.read(addNum.notifier).selectNum(identifier);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TabScreen(identifier),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text(
          'Shop App',
          style: GoogleFonts.acme(
              fontSize: 25, color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
            iconSize: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.light_mode,
            ),
            iconSize: 20,
          ),
        ],
      ),
      body: FutureBuilder(
          future: _loadedItems,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return BodyHome(
              snapshot: snapshot,
              onSelect: onSelect,
            );
          }),
    );
  }
}
