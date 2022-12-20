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
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['isAdmin'] = this.isAdmin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
