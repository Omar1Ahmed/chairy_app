import '../../../categories/domain/entity/CategoryEntity.dart';
import 'ColorEntity.dart';
import 'SizeEntity.dart';
import 'productImageEntity.dart';

class ProductEntity {
  final int id;
  final String title;
  final String description;
  final String information;
  final String shippingReturn;
  final String price;
  final String discount;
  final String discountPrice;
  final int quantity;
  final String sold;
  final int featuredProduct;
  final int bestSelling;
  final int newArrival;
  final int onSale;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<CategoryEntity> categories;
  final List<ColorEntity> colors;
  final List<SizeEntity> sizes;
  final List<ProductImageEntity> images;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.information,
    required this.shippingReturn,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.quantity,
    required this.sold,
    required this.featuredProduct,
    required this.bestSelling,
    required this.newArrival,
    required this.onSale,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
    required this.colors,
    required this.sizes,
    required this.images,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      information: json["information"],
      shippingReturn: json["shipping_return"],
      price: json["price"],
      discount: json["discount"],
      discountPrice: json["discount_Price"],
      quantity: json["quantity"],
      sold: json["sold"],
      featuredProduct: json["featured_Product"],
      bestSelling: json["best_Selling"],
      newArrival: json["new_Arrival"],
      onSale: json["on_Sale"],
      status: json["status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      categories: List<CategoryEntity>.from(json["categories"].map((x) => CategoryEntity.fromJson(x))),
      colors: List<ColorEntity>.from(json["colors"].map((x) => ColorEntity.fromJson(x))),
      sizes: List<SizeEntity>.from(json["sizes"].map((x) => SizeEntity.fromJson(x))),

      images: List<ProductImageEntity>.from(json["productimage"].map((x) => ProductImageEntity.fromJson(x))),

    );
  }

  ProductEntity toEntity() {
    return this;
  }
}