class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rate;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rate,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'] + 0.0,
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rate: Rating.fromJson(json['rating']),
    );
  }
  factory ProductModel.fromJsonUpdate(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(json) {
    return Rating(
      rate: json['rate'] + .0,
      count: json['count'],
    );
  }
}
