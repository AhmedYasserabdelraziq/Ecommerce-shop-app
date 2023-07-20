import 'package:api/providers/select_categories.dart';
import 'package:api/screen/tab_screen/all_tabs/all_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_tabs/electronics_product.dart';
import 'all_tabs/jewelery_product.dart';
import "all_tabs/men's_product.dart";
import 'all_tabs/women_product.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen(this.num,  {super.key,});
final int num;

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);

    controller.addListener(() {
      setState(() {});
    });
    Future.delayed(Duration.zero, onSelected);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSelected() {
    controller.animateTo(widget.num);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary)),
        bottom: TabBar(
          controller: controller,
          isScrollable: true,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: "men's clothing"),
            Tab(text: "women's clothing"),
            Tab(text: 'electronics'),
            Tab(text: 'jewelery'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          AllProduct(),
          MensProduct(),
          WomenProduct(),
          ElectronicsProduct(),
          JeweleryProduct(),
        ],
      ),
    );
  }
}
