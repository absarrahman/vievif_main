class VariableModel {
  int id;
  String price;
  String sku;
  String regularPrice;
  String salePrice;
  List<Attribute> attributes;

  VariableModel({this.id, this.price, this.sku, this.regularPrice,
      this.salePrice, this.attributes});

  factory VariableModel.fromJson(Map<String, dynamic> json) => VariableModel(
    id: json["id"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
  );

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