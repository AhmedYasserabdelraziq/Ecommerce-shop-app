class Product {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

class Rating {
  num rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}
