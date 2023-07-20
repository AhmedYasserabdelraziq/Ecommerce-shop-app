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
      image: 'https://cf.shopee.ph/file/f9d030225d43d313fd0e472c807bd417'),
  Swipe(
      text: "Get discount for every women's clothes, only valid for today",
      color: Colors.amberAccent,
      image:
          'https://plus.unsplash.com/premium_photo-1671198905435-20f8d166efb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d29tZW4lMjBmYXNoaW9ufGVufDB8fDB8fHww&w=1000&q=80'),
  Swipe(
      text: "Get discount for every electronics, only valid for today",
      color: Colors.blueAccent,
      image:
          'https://media.istockphoto.com/id/178716575/photo/mobile-devices.jpg?s=612x612&w=0&k=20&c=9YyINgAbcmjfY_HZe-i8FrLUS43-qZh6Sx6raIc_9vQ='),
  Swipe(
      text: "Get discount for every jewelery, only valid for today",
      color: Colors.teal,
      image:
          'https://donjjewellery.com/wp-content/uploads/2022/02/1-CUSTOM-FINE-JEWELRY-.jpg'),
];
