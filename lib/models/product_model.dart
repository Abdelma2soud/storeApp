class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'] ?? 'Unknown product',
        price: double.parse("${jsonData['price']}"),
        //  (jsonData['price'] as num).toDouble(), // التحويل إلى
        description: jsonData['description'] ?? 'No description',
        category: jsonData['category'],
        image: jsonData['image'] ?? 'There is no image',
        rating: RatingModel.fromjson(jsonData['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;
  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.fromjson(jsondata) {
    return RatingModel(
      rate: double.parse("${jsondata['rate']}"),
      count: jsondata['count'],
    );
  }
}
