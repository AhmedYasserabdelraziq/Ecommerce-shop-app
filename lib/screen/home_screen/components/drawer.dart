import 'package:api/screen/cart_screen/cart_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../widget/add_image.dart';
import '../../../widget/widget.dart';
import '../../favorite_screen/favorite_screen.dart';

final _firebase = FirebaseAuth.instance;

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
  });

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  DocumentSnapshot<Map<String, dynamic>>? userData;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: 200,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0, left: 35.0),
                  child: InputImage(
                    userData: (DocumentSnapshot<Map<String, dynamic>> user) {
                      setState(() {
                        userData = user;
                      });
                      print(user);
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (userData != null)
                        Text(
                          userData!.data()!['username'],
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      if (userData != null)
                        Text(
                          userData!.data()!['email'],
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: Colors.white),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          buildListTile(context, Icons.favorite, 'Favorite', () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const FavoriteScreen(),
              ),
            );
          }),
          buildListTile(context, Icons.shopping_cart, 'Orders', () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CartScreen()),
            );
          }),
          buildListTile(context, Icons.settings, 'Setting', () {}),
          buildListTile(context, Icons.help, 'Help', () {}),
          const Expanded(child: SizedBox()),
          IconButton(
              onPressed: () {
                _firebase.signOut();
              },
              icon: const Icon(
                Icons.logout,
                size: 35,
              ))
        ],
      ),
    );
  }
}
