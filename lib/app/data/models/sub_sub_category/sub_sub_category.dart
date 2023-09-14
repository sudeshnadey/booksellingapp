import 'dart:convert';

List<SubSubCategory> subSubCategoryFromJson(String str) =>
    List<SubSubCategory>.from(
        json.decode(str).map((x) => SubSubCategory.fromJson(x)));

String subSubCategoryToJson(List<SubSubCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubSubCategory {
  int id;
  String name;
  String image;
  int subCategoryId;
  String description;

  SubSubCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.subCategoryId,
    required this.description,
  });

  factory SubSubCategory.fromJson(Map<String, dynamic> json) => SubSubCategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        subCategoryId: json["subCategoryId"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "subCategoryId": subCategoryId,
        "description": description,
      };
}
