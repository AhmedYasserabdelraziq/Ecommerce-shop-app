import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 8,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              image,
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          name,style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
