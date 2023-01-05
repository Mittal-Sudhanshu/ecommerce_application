class user_class {
  String? sId;
  String? name;
  String? email;
  bool? isAdmin;
  String? createdAt;
  String? updatedAt;
  int? iV;

  user_class(
      {this.sId,
      this.name,
      this.email,
      this.isAdmin,
      this.createdAt,
      this.updatedAt,
      this.iV});

  user_class.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    isAdmin = json['isAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['isAdmin'] = isAdmin;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
