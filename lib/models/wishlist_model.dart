// To parse this JSON data, do
//
//     final wishlist = wishlistFromJson(jsonString);

import 'dart:convert';

List<Wishlist> wishlistFromJson(String str) => List<Wishlist>.from(json.decode(str).map((x) => Wishlist.fromJson(x)));

String wishlistToJson(List<Wishlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wishlist {
    Wishlist({
        required this.id,
        required this.product,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String id;
    final String product;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        product: json["product"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
