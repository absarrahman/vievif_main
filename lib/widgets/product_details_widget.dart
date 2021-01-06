import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';

class ProductDetailsWidget extends StatelessWidget {

  final ProductModel product;


  ProductDetailsWidget(this.product);

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          /*Center(
              child: Text(widget.product.name),
            ),*/
          productAllImages(context, product.images),
        ],
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
          Positioned(child: IconButton(
            onPressed: () => _carouselController.previousPage(),
            icon: Icon(Icons.chevron_left),
          ),
            top: 125,
          ),
          Positioned(child: IconButton(
            onPressed: ()=> _carouselController.nextPage(),
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
