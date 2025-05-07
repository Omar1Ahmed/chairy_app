class CategoryEntity {
  int id;
  String title;
  String description;
  String image;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  CategoryEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  CategoryEntity toEntity() {

    return CategoryEntity(
      id: id,
      title: title,
      description: description,
      image: image,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,

    );
  }
}