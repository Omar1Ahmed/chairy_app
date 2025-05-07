class ColorEntity {
  final int id;
  final String name;
  final String code;
  final DateTime createdAt;
  final DateTime updatedAt;

  ColorEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ColorEntity.fromJson(Map<String, dynamic> json) => ColorEntity(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}