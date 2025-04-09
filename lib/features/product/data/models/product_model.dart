import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.tags,
    required super.brand,
    required super.sku,
    required super.weight,
    required super.dimensions,
    required super.warrantyInformation,
    required super.shippingInformation,
    required super.availabilityStatus,
    required super.reviews,
    required super.returnPolicy,
    required super.minimumOrderQuantity,
    required super.meta,
    required super.images,
    required super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags']),
      brand: json['brand'] ?? 'UnKnown',
      sku: json['sku'],
      weight: (json['weight'] as num).toDouble(),
      dimensions:
          json['dimensions'] != null
              ? Dimensions(
                width: (json['dimensions']['width'] as num).toDouble(),
                height: (json['dimensions']['height'] as num).toDouble(),
                depth: (json['dimensions']['depth'] as num).toDouble(),
              )
              : Dimensions(width: 0.0, height: 0.0, depth: 0.0),
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews:
          (json['reviews'] as List)
              .map((e) => ReviewModel.fromJson(e))
              .toList(),
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: Meta(
        createdAt: DateTime.parse(json['meta']['createdAt']),
        updatedAt: DateTime.parse(json['meta']['updatedAt']),
        barcode: json['meta']['barcode'],
        qrCode: json['meta']['qrCode'],
      ),
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
    );
  }

  static Map<String, dynamic> toJson({required ProductEntity entity}) {
    return {
      'id': entity.id,
      'title': entity.title,
      'description': entity.description,
      'category': entity.category,
      'price': entity.price,
      'discountPercentage': entity.discountPercentage,
      'rating': entity.rating,
      'stock': entity.stock,
      'tags': entity.tags,
      'brand': entity.brand,
      'sku': entity.sku,
      'weight': entity.weight,
      'dimensions': {
        'width': entity.dimensions.width,
        'height': entity.dimensions.height,
        'depth': entity.dimensions.depth,
      },
      'warrantyInformation': entity.warrantyInformation,
      'shippingInformation': entity.shippingInformation,
      'availabilityStatus': entity.availabilityStatus,
      'reviews': entity.reviews.map((e) => e.toJson()).toList(),
      'returnPolicy': entity.returnPolicy,
      'minimumOrderQuantity': entity.minimumOrderQuantity,
      'meta': {
        'createdAt': entity.meta.createdAt.toIso8601String(),
        'updatedAt': entity.meta.updatedAt.toIso8601String(),
        'barcode': entity.meta.barcode,
        'qrCode': entity.meta.qrCode,
      },
      'images': entity.images,
      'thumbnail': entity.thumbnail,
    };
  }
}

class ReviewModel extends Review {
  ReviewModel({
    required super.rating,
    required super.comment,
    required super.date,
    required super.reviewerName,
    required super.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']),
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }
}
