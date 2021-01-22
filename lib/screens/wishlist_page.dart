import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/provider/wishlist_provider.dart';
import 'package:vievif/screens/product_details_page.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/list_card_widget.dart';

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
                  child: Dismissible(
                    direction: DismissDirection.endToStart,
                    key: UniqueKey(),
                    background: Container(
                      color: kYellowish,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.delete,color: kRedColor,),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.delete,color: kRedColor,),
                          ),
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                      wishlistProvider.removeProduct(product);
                    },
                    child: ProductListCard(
                      product: product,
                    ),
                  ),
                );
              })
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text('Il n\'y a rien dans votre \“mes envies\”',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
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
