class SizeEntity {
  final int id;
  final String size;
  final DateTime createdAt;
  final DateTime updatedAt;

  SizeEntity({
    required this.id,
    required this.size,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SizeEntity.fromJson(Map<String, dynamic> json) => SizeEntity(
    id: json["id"],
    size: json["Size"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}