import 'dart:convert';

List<Banners> bannerFromJson(String str) =>
    List<Banners>.from(json.decode(str).map((x) => Banners.fromJson(x)));

String bannerToJson(List<Banners> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Banners {
  int id;
  String name;
  String image;
  Description description;

  Banners({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: descriptionValues.map[json["description"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": descriptionValues.reverse[description],
      };
}

enum Description { BASJDBAJSDBASDSAD, CS, HERE, VB }

final descriptionValues = EnumValues({
  "basjdbajsdbasdsad": Description.BASJDBAJSDBASDSAD,
  "cs": Description.CS,
  "here": Description.HERE,
  "vb": Description.VB
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
