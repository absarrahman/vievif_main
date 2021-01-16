import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/provider/products_provider.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/product_card_widget.dart';

class HomeProductPage extends StatefulWidget {
  final categoryId;
  final orderBy;

  HomeProductPage({this.categoryId, this.orderBy});

  @override
  _HomeProductPageState createState() => _HomeProductPageState();
}

class _HomeProductPageState extends State<HomeProductPage> {
  int _pgNumber = 2;

  ScrollController _scrollController = ScrollController();
  TextEditingController _searchItemController = TextEditingController();
  Timer _debounce;

  @override
  void initState() {
    super.initState();
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.resetStreams();
    productProvider.setLoadingStatus(LoadStatus.BEGIN);
    productProvider.getProducts(_pgNumber,
        categoryID: widget.categoryId!=null?widget.categoryId.toString():null,orderBy: widget.orderBy);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productProvider.setLoadingStatus(LoadStatus.LOADING);
        productProvider.getProducts(++_pgNumber,
            categoryID: widget.categoryId!=null?widget.categoryId.toString():null,orderBy: widget.orderBy);
      }
    });

    _searchItemController.addListener(_onSearchChanged);
  }

  _onSearchChanged() {
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      productProvider.resetStreams();
      productProvider.setLoadingStatus(LoadStatus.BEGIN);
      productProvider.getProducts(_pgNumber,
          categoryID: widget.categoryId!=null?widget.categoryId.toString():null,
          searchProduct: _searchItemController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: Column(
        children: [
          Container(
            child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  if (productProvider.productList.length != null &&
                      productProvider.getLoadStatus() != LoadStatus.BEGIN &&
                      productProvider.productList.length > 0) {
                    print(productProvider.productList[0].images[0].src);
                    return Flexible(
                      child: _productList(productProvider.productList, context,
                          productProvider.getLoadStatus() == LoadStatus.LOADING),
                    );
                  } else if (productProvider.productList.length == 0 &&
                      productProvider.getLoadStatus() == LoadStatus.DONE) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Aucun produit ne correspond à votre sélection.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  }
                  print(
                      'Loading status is ${productProvider.getLoadStatus() == LoadStatus.DONE}');
                  print('Length is ${productProvider.productList.length}');
                  return Padding(
                    padding: EdgeInsets.only(top: (size.height/3.5)*1.0),
                    child: CommonWidgets.loading(),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _productList(
      List<ProductModel> itemList, BuildContext context, bool isLoading) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Flexible(
            child: GridView.count(
              controller: _scrollController,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              children: itemList
                  .map(
                    (ProductModel product) =>
                    ProductCardWidget(product: product),
              )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: CommonWidgets.loading(),
              ),
            ),
            visible: isLoading,
          ),
        ],
      ),
    );
  }
}
