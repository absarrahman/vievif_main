import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vievif/models/product_category.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/services/config.dart';

class ApiService {
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> data = List<CategoryModel>();

    String apiPath = WooConfig.baseUrl +
        WooConfig.categoriesUrl +
        '?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}';
    String apiPathToProd = WooConfig.baseUrl +
        WooConfig.productsUrl +
        '?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}';
    print('API PATH PRODUCTS $apiPathToProd');
    try {
      var response = await Dio().get(apiPath,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));

      if (response.statusCode == 200) {
        var body = response.data as List; //need list
        for (int i = 0; i < body.length; i++) {
          data.add(CategoryModel.fromJson(body[i]));
        }
      }
      print('API PATH is $apiPath');
      print('Category List is ${data.toString()}');
    } on DioError catch (e) {
      print('API SERVICE ' + e.toString());
    }
    return data;
  }

  Future<List<ProductModel>> getProducts({
    int pgNumber,
    int pgSize,
    String searchProduct,
    String categoryId,
    String tagName,
    String orderBy,
    String sortingOrder = 'asc',
  }) async {

    List<ProductModel> data = List<ProductModel>();

    String path = '';

    if (searchProduct != null) {
      path += '&search=$searchProduct';
    }

    if (pgNumber != null) {
      path += '&page=$pgNumber';
    }

    if (pgSize != null) {
      path += '&per_page=$pgSize';
    }

    if (tagName != null) {
      path += '&tag=$tagName';
    }

    if (categoryId != null) {
      path += '&category=$categoryId';
    }

    if (sortingOrder!=null) {
      path += '&order=$sortingOrder';
    }

    if (orderBy != null) {
      path += '&orderby=$orderBy';
    }

    String apiPath = WooConfig.baseUrl +
        WooConfig.productsUrl +
        '?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}$path';

    try {

      var response = await Dio().get(apiPath,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));

      if (response.statusCode == 200) {
        var body = response.data as List; //need list
        for (int i = 0; i < body.length; i++) {
          data.add(ProductModel.fromJson(body[i]));
        }
      }
      print('API PATH is $apiPath');
      print('Category List is ${data.toString()}');
    } on DioError catch (e) {
      print('API SERVICE ' + e.toString());
    }
    return data;
  }
}
