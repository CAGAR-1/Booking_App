// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));

String serviceModelToJson(List<ServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceModel {
    String id;
    String name;
    String categoryId;
    String description;
    String price;
    String image;
    String shopId;
    String shopName;
    String shopStatus;

    ServiceModel({
        required this.id,
        required this.name,
        required this.categoryId,
        required this.description,
        required this.price,
        required this.image,
        required this.shopId,
        required this.shopName,
        required this.shopStatus,
    });

    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        shopId: json["shop_id"],
        shopName: json["shop_name"],
        shopStatus: json["shop_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "description": description,
        "price": price,
        "image": image,
        "shop_id": shopId,
        "shop_name": shopName,
        "shop_status": shopStatus,
    };
}
