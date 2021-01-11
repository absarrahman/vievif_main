import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/stepper_counter.dart';

class ProductDetailsWidget extends StatefulWidget {
  final ProductModel product;

  ProductDetailsWidget(this.product);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  final CarouselController _carouselController = CarouselController();
  int amount = 0;
  List<String> selectedList = List(2);
  bool isAttribute1, isAttribute2;

  @override
  Widget build(BuildContext context) {
    debugPrint('Attributes ${widget.product.store.vendorDisplayName}');
    //  debugPrint('Vendor mobile banner ${product.store.mobileBanner}');
    debugPrint('Vendor Image ${widget.product.store.vendorShopLogo}');
    //int x = 1;
    isAttribute1 = (widget.product.attributes.length > 0) &&
        (widget.product.attributes != null) &&
        (widget.product.attributes[0].options.length > 1);
    isAttribute2 = (widget.product.attributes.length > 0) &&
        (widget.product.attributes != null) &&
        (widget.product.attributes[1].options.length > 1);
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
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isAttribute1,
                child: Center(
                  child: attributeDetails(widget.product.attributes[0], 0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isAttribute2,
                child: Center(
                  child: attributeDetails(widget.product.attributes[1], 1),
                ),
              ),
              StepperCounter(
                  lowerBound: 0,
                  upperBound: 10,
                  stepIncrementValue: 1,
                  value: this.amount,
                  stepperIconSize: 22,
                  onChanged: (value) {
                    print(value);
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget attributeDetails(AttributeModel attribute, int index) {
    /*return Text((product.attributes.length > 0) && (product.attributes != null)
        ? ('${product.attributes[0].options.join('\n\n').toUpperCase().toString()}')
        : '');*/
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
          child: DropdownButton(
            hint: Text('Choisir une option'),
            value: selectedList[index],
            icon: Icon(Icons.color_lens_outlined),
            items: attribute.options.map((String value) {
              return new DropdownMenuItem(
                value: value,
                child: Text(value),
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
