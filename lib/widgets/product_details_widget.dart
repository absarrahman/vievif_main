import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/models/variable_model.dart';
import 'package:vievif/provider/cart_provider.dart';
import 'package:vievif/provider/wishlist_provider.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/product_description_widget.dart';
import 'package:vievif/widgets/product_rating_widget.dart';
import 'package:vievif/widgets/stepper_counter.dart';

class ProductDetailsWidget extends StatefulWidget {
  final ProductModel product;
  final List<VariableModel> variableList;

  ProductDetailsWidget({this.product, this.variableList});

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  final CarouselController _carouselController = CarouselController();
  int amount = 0;

  //List<String> selectedList = List(2);
  //List<VariableModel> selectedList = List(1);
  bool isAttribute1, isAttribute2;
  bool isFavorite;
  VariableModel selected;

  @override
  Widget build(BuildContext context) {
    var wishlistProvider =
        Provider.of<WishListProvider>(context, listen: false);
    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    isFavorite = wishlistProvider.productIDList.contains(widget.product.id)
        ? true
        : false;

    debugPrint('Attributes $isFavorite');
    debugPrint('Vendor Image ${widget.product.type}');

    isAttribute1 = (widget.product.attributes.length > 0) &&
        (widget.product.attributes != null) &&
        (widget.product.attributes[0].options.length > 1);
    isAttribute2 = (widget.product.attributes.length > 0) &&
        (widget.product.attributes != null) &&
        (widget.product.attributes[1].options.length > 1);
    print('Price is ${selected != null ? selected.price : ''}');
    debugPrint('ATTRIBUTE $isAttribute1');
    return Container(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productAllImages(context, widget.product.images),
              CommonWidgets.onSale(widget.product),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: itemName(widget.product),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: FavoriteButton(
                    isFavorite: isFavorite,
                    valueChanged: (_isFavorite) {
                      /*isFavorite = _isFavorite;
                      isFavorite == false
                          ? wishlistProvider.removeProduct(widget.product)
                          : wishlistProvider.addProduct(widget.product);*/
                      setState(() {
                        isFavorite = _isFavorite;
                      });
                      isFavorite == false
                          ? wishlistProvider.removeProduct(widget.product)
                          : wishlistProvider.addProduct(widget.product);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingWidget(rating: widget.product.averageRating),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: selected == null
                        ? HtmlWidget(
                            widget.product.priceHtml,
                            webView: true,
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          )
                        : Text(
                            selected.salePrice == ''
                                ? CommonWidgets.numberFormatter(selected.price)
                                : CommonWidgets.numberFormatter(
                                    selected.salePrice),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isAttribute1,
                child: Center(
                    child: varOptions(
                        widget.variableList, isAttribute1, isAttribute2)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StepperCounter(
                        lowerBound: 0,
                        upperBound: widget.product.stockQuantity,
                        stepIncrementValue: 1,
                        value: this.amount,
                        stepperIconSize: 22,
                        onChanged: (value) {
                          amount = value;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.product.purchasable
                        ? FlatButton(
                            height: 50,
                            color: kYellowish,
                            onPressed: () {
                              double price = amount * double.parse(selected.price);
                              print('Price is $price');
                              if (selected != null && (amount > 0)) {
                                cartProvider.addProduct(
                                  product: widget.product,
                                  variation: selected,
                                  quantity: amount,
                                  isAttribute1: isAttribute1,
                                  isAttribute2: isAttribute2,
                                  price: price,
                                );
                                print("WITH SELECTED");
                              } else if (!(isAttribute1) && (amount > 0)) {
                                cartProvider.addProduct(
                                  product: widget.product,
                                  quantity: amount,
                                  isAttribute1: isAttribute1,
                                  isAttribute2: isAttribute2,
                                  price: price,
                                );
                                print("WITHOUT SELECTED");
                              }
                            },
                            child: Text(
                              'Ajouter au panier',
                              style: TextStyle(color: kSurfaceWhite),
                            ),
                            shape: StadiumBorder(),
                          )
                        : Container(
                            height: 50,
                            width: 150,
                            child: Center(
                              child: Text(
                                'En rupture de stock',
                                style: TextStyle(
                                    color: kRedColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: kYellowish,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              DescriptionWidget(
                description: widget.product.description,
              ),
              SizedBox(
                height: 20,
              ),
              CommonWidgets.header('Produits similaires'),
              relatedProducts(),
            ],
          ),
        ],
      ),
    );
  }

  Widget varOptions(
      List<VariableModel> variable, bool isAttribute1, bool isAttribute2) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: DropdownButton<VariableModel>(
        hint: Text('Choisir une option'),
        value: selected,
        icon: Icon(Icons.color_lens_outlined),
        items: variable.map((VariableModel value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
                '${value.attributes[0].name} ${value.attributes[0].option} \n${isAttribute2 ? value.attributes[1].name.toString() + ' ' + value.attributes[1].option.toString() : ''}'),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selected = value;
          });
        },
      ),
    );
  }

  /*Widget attributeDetails(
      AttributeModel attribute, int index, List<VariableModel> variable) {
    */ /*return Text((product.attributes.length > 0) && (product.attributes != null)
        ? ('${product.attributes[0].options.join('\n\n').toUpperCase().toString()}')
        : '');*/ /*
    return Column(
      children: [
        Text(
          attribute.name,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButton<VariableModel>(
            hint: Text('Choisir une option'),
            value: selectedList[index],
            icon: Icon(Icons.color_lens_outlined),
            items: variable.map((VariableModel value) {
              return DropdownMenuItem(
                value: value,
                child: Text('${value.attributes[index].option}'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedList[index] = value;
              });
            },
          ),
        ),
      ],
    );
  }*/

  Widget relatedProducts() {
    return Container(
      child: FutureBuilder(
          future: ApiService().getProducts(
              pgNumber: 1, relatedProductIds: widget.product.relatedIds),
          builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
            if (snapshot.hasData) {
              return CommonWidgets.rowProducts(snapshot.data);
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CommonWidgets.loading();
            } else {
              return Container(
                child: Text('Aucun produit similaire n\'est disponible'),
              );
            }
          }),
    );
  }

  Widget itemName(ProductModel product) {
    return Center(
      child: Text(
        product.name,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Widget productAllImages(BuildContext context, List<ImageModel> imageList) {
    var size = MediaQuery.of(context).size;
    print('IMAGE LINK ${imageList[0].src}');
    return SizedBox(
      height: 300,
      width: size.width,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Center(
                    child: Image.network(
                      'https:${imageList[index].src}',
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              carouselController: _carouselController,
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 1,
                enlargeCenterPage: true,
              ),
            ),
          ),
          Positioned(
            child: IconButton(
              onPressed: () => _carouselController.previousPage(),
              icon: Icon(Icons.chevron_left),
            ),
            top: 125,
          ),
          Positioned(
            child: IconButton(
              onPressed: () => _carouselController.nextPage(),
              icon: Icon(Icons.chevron_right),
            ),
            top: 120,
            left: size.width - 50,
          ),
        ],
      ),
    );
  }
}
