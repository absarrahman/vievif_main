import 'package:flutter/material.dart';

class CreateProductProvider with ChangeNotifier {
  String _name = '';
  String _type = '';
  String _regularPrice = '';
  String _description = '';
  String _shortDescription;
  List<Map<String, int>> _categories;
  List<Map<String, String>> _images;

  String get name => _name;

  String get type => _type;

  String get regularPrice => _regularPrice;

  String get description => _description;

  String get shortDescription => _shortDescription;

  List<Map<String, int>> get categories => _categories;

  List<Map<String, String>> get images => _images;


  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setType(String value) {
    _type = value;
    notifyListeners();
  }

  void setRegularPrice(String value) {
    _regularPrice = value;
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  void setShortDescription(String value) {
    _shortDescription = value;
    notifyListeners();
  }

  void addCategory(int id) {
    _categories.add({
      'id':id
    });
  }

  void addImage(String path) {
    _images.add({
      'src': path
    });
  }

}