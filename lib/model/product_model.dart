class ProductModel {
  final String title;
  final double price;
  final double rating;
  final String thumbnail;

  ProductModel({
    required this.title,
    required this.price,
    required this.rating,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'],
      rating: json['rating'],
      thumbnail: json['thumbnail'],
    );
  }
}
