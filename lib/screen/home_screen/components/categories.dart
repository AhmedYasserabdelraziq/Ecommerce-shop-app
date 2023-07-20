import 'package:flutter/material.dart';

import '../../../model/products.dart';
import 'categories_view.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    required this.onSelect,
    required this.snapshot,
  });

  final void Function(int num) onSelect;
  final AsyncSnapshot<List<Product>> snapshot;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => widget.onSelect(1),
          child: CategoriesView(
              name: "men's clothing", image: widget.snapshot.data![2].image),
        ),
        const SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () => widget.onSelect(2),
          child: CategoriesView(
              name: "women's clothing", image: widget.snapshot.data![19].image),
        ),
        const SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () => widget.onSelect(3),
          child: CategoriesView(
              name: "electronics", image: widget.snapshot.data![11].image),
        ),
        const SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () => widget.onSelect(4),
          child: CategoriesView(
            name: "jewelery",
            image: widget.snapshot.data![6].image,
          ),
        ),
      ],
    );
  }
}
