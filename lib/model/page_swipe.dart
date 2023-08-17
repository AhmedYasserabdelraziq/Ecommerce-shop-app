import 'package:flutter/material.dart';

class Swipe {
  final String? text;
  final Color color;
  final String image;

  const Swipe({required this.image, required this.text, required this.color});
}

const pageView = [
  Swipe(
      text: "Get discount for every men's clothes, only valid for today",
      color: Colors.orange,
      image: 'assets/card_view/img.png'),
  Swipe(
      text: "Get discount for every women's clothes, only valid for today",
      color: Colors.amberAccent,
      image: 'assets/card_view/img_1.png'),
  Swipe(
      text: "Get discount for every electronics, only valid for today",
      color: Colors.blueAccent,
      image: 'assets/card_view/img_2.png'),
  Swipe(
      text: "Get discount for every jewelery, only valid for today",
      color: Colors.teal,
      image: 'assets/card_view/img_3.png'),
];
