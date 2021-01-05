import 'package:flutter/foundation.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _productList;
  ApiService _apiService;
  int pgSize = 10;

  SortType _sortType;

  List<ProductModel> get productList => _productList;

  double get totalItems => _productList.length.toDouble();

  LoadStatus _loadStatus = LoadStatus.DONE;

  getLoadStatus() => _loadStatus;

  ProductProvider() {
    _sortType = SortType('Popularity', 'popularity', 'asc');
  }

  resetStreams() {
    _productList = List<ProductModel>();
    _apiService = ApiService();
  }

  setLoadingStatus(LoadStatus loadStatus) {
    _loadStatus = loadStatus;
    notifyListeners();
  }

  setOrder(SortType sortType) {
    _sortType = sortType;
    notifyListeners();
  }

  getProducts(int pgNumber,
      {String searchProduct,
      String tagName,
      String categoryID,
      String orderBy,
      String sortingOrder = 'asc'}) async {

    List<ProductModel> productModelList = await _apiService.getProducts(
      sortingOrder: this._sortType.sortType,
      tagName: tagName,
      searchProduct: searchProduct,
      orderBy: this._sortType.value,
      categoryId: categoryID,
      pgNumber: pgNumber,
      pgSize: pgSize
    );

    if (productModelList.length > 0) {
      _productList.addAll(productModelList);
    }

    //completed
    setLoadingStatus(LoadStatus.DONE);

  }
}

class SortType {
  String displayText, value, sortType;

  SortType(this.displayText, this.value, this.sortType);
}

enum LoadStatus {
  BEGIN,
  LOADING,
  DONE,
}
