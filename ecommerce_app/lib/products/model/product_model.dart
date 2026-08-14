class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String? brand;       // 💡 Changed String to String? (Allows null safely)
  final String thumbnail;
  final List<String> images;
  final List<Review> reviews;

  Product({
    this.brand,              // 💡 Removed 'required' keyword for optional brand field
    required this.category,
    required this.description,
    required this.discountPercentage,
    required this.id,
    required this.images,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.stock,
    required this.thumbnail,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      // 💡 Added fallback values (?? '') or safe castings for null protection
      brand: json['brand'] as String?, 
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      id: json['id'] as int,
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviews: json['reviews'] != null 
          ? (json['reviews'] as List)
              .map((item) => Review.fromJson(item as Map<String, dynamic>))
              .toList()
          : [],
      stock: json['stock'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      title: json['title'] ?? '',
    );
  }
}


class Review {
  final int rating;
  final String comment;
  final String reviewerName;

  Review({
    required this.comment,
    required this.rating,
    required this.reviewerName,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      comment: json['comment'],
      rating: json['rating'],
      reviewerName: json['reviewerName'],
    );
  }
}
