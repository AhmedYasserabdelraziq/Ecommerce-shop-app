class MyCart {
  int id;
  int userId;
  String date;
  List<Products> products;

  MyCart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });
}

class Products {
  int productId;
  int quantity;

  Products({
    required this.productId,
    required this.quantity,
  });
}
