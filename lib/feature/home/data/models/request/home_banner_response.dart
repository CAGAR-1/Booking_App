// To parse this JSON data, do
//
//     final packageAndOfferModel = packageAndOfferModelFromJson(jsonString);

import 'dart:convert';

List<PackageAndOfferModel> packageAndOfferModelFromJson(String str) =>
    List<PackageAndOfferModel>.from(
        json.decode(str).map((x) => PackageAndOfferModel.fromJson(x)));

String packageAndOfferModelToJson(List<PackageAndOfferModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PackageAndOfferModel {
  String id;
  String image;
  String description;
  String price;
  String shopId;
  String name;

  PackageAndOfferModel({
    required this.id,
    required this.image,
    required this.description,
    required this.price,
    required this.shopId,
    required this.name,
  });

  factory PackageAndOfferModel.fromJson(Map<String, dynamic> json) =>
      PackageAndOfferModel(
        id: json["id"],
        image: json["image"],
        description: json["description"],
        price: json["price"],
        shopId: json["shop_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "description": description,
        "price": price,
        "shop_id": shopId,
        "name": name,
      };
}
