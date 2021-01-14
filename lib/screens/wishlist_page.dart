import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/provider/wishlist_provider.dart';
import 'package:vievif/screens/product_details_page.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/wishlist_widget.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wishlistProvider = Provider.of<WishListProvider>(context);
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: wishlistProvider.productList != null &&
              wishlistProvider.productList.length > 0
          ? ListView.builder(
              itemCount: wishlistProvider.productList.length,
              itemBuilder: (context, index) {
                var product = wishlistProvider.productList[index];
                return GestureDetector(
                  onTap: () => _navigateProductPage(product, context),
                  child: ProductListCard(
                    product: product,
                  ),
                );
              })
          : Center(
              child: Container(
                child: Text('Empty'),
              ),
            ),
    );
  }

  _navigateProductPage(ProductModel product, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
          product: product,
        ),
      ),
    );
  }
}
