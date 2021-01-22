class VariableModel {
  int id;
  String price;
  VarImageModel image;
  String sku;
  String regularPrice;
  String salePrice;
  List<Attribute> attributes;

  VariableModel({this.id, this.price, this.image, this.sku, this.regularPrice,
      this.salePrice, this.attributes});

  factory VariableModel.fromJson(Map<String, dynamic> json) => VariableModel(
    id: json["id"],
    sku: json["sku"],
    image: VarImageModel.fromJson(json['image']),
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
  );

}

class VarImageModel {
  int id;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String src;
  String name;
  String alt;

  VarImageModel(
      {this.id,
        this.dateCreated,
        this.dateCreatedGmt,
        this.dateModified,
        this.dateModifiedGmt,
        this.src,
        this.name,
        this.alt});

  VarImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['src'] = this.src;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}

class Attribute {
  Attribute({
    this.id,
    this.name,
    this.option,
  });

  int id;
  String name;
  String option;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    name: json["name"],
    option: json["option"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "option": option,
  };
}