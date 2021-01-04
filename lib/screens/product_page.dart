import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/provider/products_provider.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

class ProductPage extends StatefulWidget {
  final categoryId;

  ProductPage({this.categoryId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _pgNumber = 1;

  ScrollController _scrollController = ScrollController();
  TextEditingController _searchItemController = TextEditingController();
  Timer _debounce;

  final _orderByMenuItem = [
    SortType('Popularity', 'popularity', 'asc'),
    SortType('Latest', 'modified', 'asc'),
    SortType('Price: High to Low', 'price', 'asc'),
    SortType('Price: Low to High', 'price', 'desc'),
  ];

  @override
  void initState() {
    super.initState();
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.resetStreams();
    productProvider.setLoadingStatus(LoadStatus.BEGIN);
    productProvider.getProducts(_pgNumber,categoryID: widget.categoryId.toString());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productProvider.setLoadingStatus(LoadStatus.LOADING);
        productProvider.getProducts(++_pgNumber);
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
      productProvider.getProducts(_pgNumber,categoryID: widget.categoryId.toString(),searchProduct: _searchItemController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kYellowish,
      ),
      body: Container(
        child: Consumer<ProductProvider>(builder: (context, productModel, child) {
          if (productModel.productList.length != null &&
              productModel.getLoadStatus() != LoadStatus.BEGIN &&
              productModel.productList.length > 0) {
            print(productModel.productList[0].images[0].src);
            return _productList(productModel.productList, context,
                productModel.getLoadStatus() == LoadStatus.LOADING);
          }  else if (productModel.productList.length == 0 && productModel.getLoadStatus()==LoadStatus.DONE) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('No items available',style:
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),),
              ],
            );
          }
          print('Loading status is ${productModel.getLoadStatus()==LoadStatus.DONE}');
          print('Length is ${productModel.productList.length}');
          return CommonWidgets.loading();
        }),
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
          itemPreference(),
          Flexible(
            child: GridView.count(
              controller: _scrollController,
              crossAxisCount: 2,
              //shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              children: itemList
                  .map(
                      (ProductModel productModel) => _productCard(productModel))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonWidgets.loading(),
            ),
            visible: isLoading,
          ),
        ],
      ),
    );
  }

  Widget _productCard(ProductModel productModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        width: 200,
        child: Material(
          elevation: 7,
          color: kBackgroundWhite,
          borderOnForeground: true,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Image.network(
                  'http:${productModel.images[0].src}',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '${productModel.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${productModel.ratingCount}'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemPreference() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _searchItemController,
                decoration: InputDecoration(
                  hintText: 'Recherche',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  contentPadding: EdgeInsets.only(top: 20),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: kRedColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kYellowish),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kRedColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                //onSubmitted: submitSearch,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: PopupMenuButton(
                icon: Icon(Icons.sort_outlined,color: kRedColor,),
                itemBuilder: (context) {
                  return _orderByMenuItem.map((sortOption) {
                    return PopupMenuItem(
                      child: Container(
                        child: Text(sortOption.displayText),
                      ),
                      value: sortOption,
                    );
                  }).toList();
                },
                onSelected: (orderBy) {
                  var productProvider = Provider.of<ProductProvider>(context,listen: false);
                  productProvider.resetStreams();
                  productProvider.setOrder(orderBy);
                  productProvider.getProducts(_pgNumber);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
