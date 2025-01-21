import '../domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  }) : super(
    photo: image ?? '',
    name: title ?? "No Name",
    desc: description ?? "",
    priceEntity: price ?? 0.0,
  );

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"] != null ? (json["price"] as num).toDouble() : null,
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double? rate;
  final int? count;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json["rate"] != null ? (json["rate"] as num).toDouble() : null,
      count: json["count"],
    );
  }
}
