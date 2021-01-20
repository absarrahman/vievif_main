import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vievif/models/order_model.dart';
import 'package:vievif/models/product_category.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/models/variable_model.dart';
import 'package:vievif/models/vendor_product_model.dart';
import 'package:vievif/provider/create_product_provider.dart';
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
    List<dynamic> relatedProductIds,
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

    if (sortingOrder != null) {
      path += '&order=$sortingOrder';
    }

    if (orderBy != null) {
      path += '&orderby=$orderBy';
    }

    if (relatedProductIds != null) {
      path += '&include=${relatedProductIds.join(',').toString()}';
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

  Future<UserModel> login(String email, String password) async {
    try {
      var response = await Dio().post(
        WooConfig.authTokenUrl,
        data: {
          'username': email,
          'password': password,
        },
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
        }),
      );
      print('RESPONSE DATA is ${response.data['data']}');
      var token = response.data['data']['token'];
      String id = (response.data['data']['id']).toString();
      print('ID is $token');
      // https://example.com/wp-json/wp/v2/users/<id>
      print(
          'ID PATH ${WooConfig.userDetailsUrl + '$id?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}'}');
      response = await Dio().get(
          WooConfig.userDetailsUrl +
              '$id?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}',
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));

      print('RESPONSE2 data is ${response.data}');
      UserModel user = UserModel.fromJson(response.data);
      user.token = token;
      print('Email is ${user.email}');
      print('Token ${user.token}');
      print('Role ${user.role}');
      return user;
    } on DioError catch (e) {
      print("Error " + e.toString());
    }
  }

  Future<List<VariableModel>> getVariableProductList(String productID) async {
    String path = WooConfig.baseUrl +
        WooConfig.productsUrl +
        '$productID/${WooConfig.variableProductUrl}?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}';

    print('VAR API PATH $path');
    List<VariableModel> data = List<VariableModel>();

    try {
      var response = await Dio().get(path,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));

      if (response.statusCode == 200) {
        var body = response.data as List; //need list
        for (int i = 0; i < body.length; i++) {
          data.add(VariableModel.fromJson(body[i]));
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return data;
  }

  Future<bool> createOrder({OrderModel order, UserModel user}) async {
    bool isOrderCreated = false;

    /*var authToken = base64.encode(
        utf8.encode(WooConfig.consumerKey + ':' + WooConfig.consumerSecret));*/

    String path = WooConfig.baseUrl +
        WooConfig.orderProductUrl +
        '?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}&customer_id=${order.customerId}';

    //print("AUTH TOKEN IS $authToken");
    print("PATH IS $path");
    print('Order is ${order.toJson()}');

    try {
      var response = await Dio().post(
        path,
        data: order.toJson(),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      print(response.data);

      isOrderCreated = response.statusCode == 201 ? true : false;
    } on DioError catch (e) {
      print(e.error);
    }
    return isOrderCreated;
  }

  Future<List<OrderModel>> getOrdersOfUser({UserModel user}) async {
    List<OrderModel> data = List();
    String path;
    if (user == null) {
      path = WooConfig.baseUrl +
          WooConfig.orderProductUrl +
          '?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}';
    } else {
      path = WooConfig.baseUrl +
          WooConfig.orderProductUrl +
          '?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}&customer_id=${user.id}';
    }
    print("Path is $path");
    try {
      var response = await Dio().get(path,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));

      if (response.statusCode == 200) {
        var body = response.data as List; //need list
        for (int i = 0; i < body.length; i++) {
          data.add(OrderModel.fromJson(body[i]));
        }
      }

      print("USER'S order is ${response.data}");
    } catch (e) {
      print(e.toString());
    }
    return data;
  }

  Future<OrderModel> getSpecificOrder({UserModel user, int id}) async {
    OrderModel order;
    String path;

    if (user == null) {
      path = WooConfig.baseUrl +
          WooConfig.orderProductUrl +
          '/$id?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}';
    } else {
      path = WooConfig.baseUrl +
          WooConfig.orderProductUrl +
          '/$id?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}&customer_id=${user.id}';
    }

    try {
      var response = await Dio().get(path,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));

      if (response.statusCode == 200) {
        var body = response.data;
        order = OrderModel.fromJson(body);
      }
    } on DioError catch (e) {
      debugPrint(e.message);
    }

    return order;
  }

  Future<bool> updateSpecificOrder({int id, String status}) async {
    String path;

    path = WooConfig.baseUrl +
        WooConfig.orderProductUrl +
        '/$id?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}';

    try {
      var response = await Dio().put(path,
          data: {
            "status": status,
          },
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));

      if (response.statusCode == 200) {
        return true;
      }
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return false;
  }

  Future<List<VendorProductModel>> getVendorProducts(
      {int id, UserModel user}) async {
    List<VendorProductModel> data = List<VendorProductModel>();
    String path = WooConfig.storeVendorList +
        '/$id/products?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}';

    print(path);
    try {
      var response = await Dio().get(path,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'Authorization': 'Bearer ${user.token}'
          }));

      print('V data ${response.data}');
      if (response.statusCode == 200) {
        var body = response.data as List; //need list
        for (int i = 0; i < body.length; i++) {
          data.add(VendorProductModel.fromJson(body[i]));
        }
      }
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    print('Data length ${data.length}');
    return data;
  }

  Future<bool> addVendorProducts(
      {int id,
      UserModel user,
      CreateProductProvider createProductProvider}) async {
    String path = WooConfig.storeVendorList +
        '/$id/products?consumer_key=${WooConfig.consumerKey}&consumer_secret=${WooConfig.consumerSecret}';

    print(path);
    try {
      var response = await Dio().post(path,
          data: {
        'name': createProductProvider.name,
            'type': createProductProvider.type,
            'regular_price': createProductProvider.regularPrice,
            'description': createProductProvider.description,
            'short_description': createProductProvider.shortDescription,
            'categories': createProductProvider.categories,
            'images': createProductProvider.images,
          },
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'Authorization': 'Bearer ${user.token}'
          }));

      print('V data ${response.data}');
      if (response.statusCode == 200) {
        return true;
      }
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return false;
  }
}
