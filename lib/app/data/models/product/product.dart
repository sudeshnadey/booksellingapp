import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int id;
  Name name;
  String image;
  int? categoryId;
  int? subCategoryId;
  dynamic sub2CategoryId;
  Description description;
  int mrp;
  int discount;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryId,
    required this.subCategoryId,
    required this.sub2CategoryId,
    required this.description,
    required this.mrp,
    required this.discount,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        image: json["image"],
        categoryId: json["categoryId"],
        subCategoryId: json["subCategoryId"],
        sub2CategoryId: json["sub2CategoryId"],
        description: descriptionValues.map[json["description"]]!,
        mrp: json["mrp"],
        discount: json["discount"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "categoryId": categoryId,
        "subCategoryId": subCategoryId,
        "sub2CategoryId": sub2CategoryId,
        "description": descriptionValues.reverse[description],
        "mrp": mrp,
        "discount": discount,
        "quantity": quantity,
      };
}

enum Description { BASJDBAJSDBASDSAD, HERE }

final descriptionValues = EnumValues({
  "basjdbajsdbasdsad": Description.BASJDBAJSDBASDSAD,
  "here": Description.HERE
});

enum Name { B1, B1_FDFSSDSSSD, B3 }

final nameValues = EnumValues(
    {"B1": Name.B1, "B1fdfssdsssd": Name.B1_FDFSSDSSSD, "B3": Name.B3});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
