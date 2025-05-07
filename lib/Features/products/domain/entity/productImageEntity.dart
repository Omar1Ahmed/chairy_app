class ProductImageEntity {
  final int id;
  final int productId;
  final String link;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductImageEntity({
    required this.id,
    required this.productId,
    required this.link,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductImageEntity.fromJson(Map<String, dynamic> json) => ProductImageEntity(
    id: json["id"],
    productId: json["product_id"],
    link: json["link"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}