// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
    CartModel({
        required this.id,
        required this.user,
        required this.productId,
        required this.count,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String id;
    final User user;
    final ProductId productId;
    final int count;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["_id"],
        user: User.fromJson(json["User"]),
        productId: ProductId.fromJson(json["productId"]),
        count: json["count"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "User": user.toJson(),
        "productId": productId.toJson(),
        "count": count,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class ProductId {
    ProductId({
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

    final String id;
    final String title;
    final String category;
    final String details;
    final int stock;
    final int price;
    final List<Image> image;
    final String seller;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        title: json["title"],
        category: json["category"],
        details: json["details"],
        stock: json["stock"],
        price: json["price"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
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
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
        "seller": seller,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Image {
    Image({
        required this.url,
        required this.id,
    });

    final String url;
    final String id;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.isAdmin,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String id;
    final String name;
    final String email;
    final String password;
    final bool isAdmin;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
