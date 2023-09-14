import 'dart:convert';

List<SubCategory> subCategoryFromJson(String str) => List<SubCategory>.from(
    json.decode(str).map((x) => SubCategory.fromJson(x)));

String subCategoryToJson(List<SubCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategory {
  int id;
  Name name;
  String image;
  int categoryId;
  Description description;

  SubCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryId,
    required this.description,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        image: json["image"],
        categoryId: json["categoryId"],
        description: descriptionValues.map[json["description"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "categoryId": categoryId,
        "description": descriptionValues.reverse[description],
      };
}

enum Description { BASJDBAJSDBASDSAD, BASJDBAJSDBASDSAD_DDD, HERE }

final descriptionValues = EnumValues({
  "basjdbajsdbasdsad": Description.BASJDBAJSDBASDSAD,
  "basjdbajsdbasdsad ddd": Description.BASJDBAJSDBASDSAD_DDD,
  "here": Description.HERE
});

enum Name { B1, B3, B3_DDDD }

final nameValues =
    EnumValues({"B1": Name.B1, "B3": Name.B3, "B3 dddd": Name.B3_DDDD});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
