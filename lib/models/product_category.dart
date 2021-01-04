class CategoryModel {
  int id, parent;
  String name, description;
  var image;

  CategoryModel({this.id, this.name, this.description, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    //image = json['image'] == null ? null : Image.fromJson(json['image']);
    image = json['image'];
    parent = json['parent'];
  }
}

/*class Image {
  String url;

  Image({this.url});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['src'];
  }
}*/
