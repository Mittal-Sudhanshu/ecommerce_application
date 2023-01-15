// To parse this JSON data, do
//
//     final wishlist = wishlistFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Wishlist> wishlistFromJson(String str) => json.decode(str) == null ? [] : List<Wishlist>.from(json.decode(str)!.map((x) => Wishlist.fromJson(x)));

String wishlistToJson(List<Wishlist?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Wishlist {
    Wishlist({
        required this.id,
        required this.product,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String? id;
    Product? product;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        product: Product.fromJson(json["product"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product!.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Product {
    Product({
        required this.id,
        required this.title,
        required this.category,
        required this.details,
        required this.stock,
        required this.price,
        required this.image,
        required this.seller,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String? id;
    String? title;
    String? category;
    String? details;
    int? stock;
    int? price;
    List<Image?>? image;
    String? seller;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        title: json["title"],
        category: json["category"],
        details: json["details"],
        stock: json["stock"],
        price: json["price"],
        image: json["image"] == null ? [] : List<Image?>.from(json["image"]!.map((x) => Image.fromJson(x))),
        seller: json["seller"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "category": category,
        "details": details,
        "stock": stock,
        "price": price,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x!.toJson())),
        "seller": seller,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Image {
    Image({
        required this.url,
        required this.id,
    });

    String? url;
    String? id;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
    };
}
